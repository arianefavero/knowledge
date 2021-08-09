<?php

namespace App\Services;

use App\Models\Users;
use App\Models\Login;
use App\Models\Transactions;
use App\Models\Wallet;
use App\Utils\Index;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Ramsey\Uuid\Uuid;
use App\Services\UserServices;

//!  Camada de regra de negócio. 
/*!
  Serviço que gerencia a consulta de saldo do usuário, a permissão em fazer a transferência pelo tipo de documento e o update nos valores de entrada e saída dos usuários
*/
class TransactionService
{

    private $userService;

    public function __construct()
    {
        $this->userService = new UserServices;
    }

    public function transf($data)
    {
        $userOrigin = $this->userService->getUserByWallet($data['wallet_origin']);

        //Só é permitido transação entre usuários caso a conta de origem seja tipo 0 (CPF)
        if($userOrigin->document_type == 1){
            return ['ret' => 1, 'msg' => 'Usuário não permitido para esta transação']; 
        }

        //mock autorizador de transações
        $authorization = Index::hasAuthorization();

        //Só é permitido transação entre usuários caso o retorno do mock seja == Autorizado
        if($authorization != 'Autorizado'){
            return ['ret' => 1, 'msg' => 'Transação não autorizada']; 
        }

        //Só é permitido transação entre usuários caso o valor da transação seja menor que o valor que o usuário possui de saldo
        if($data['transaction_value'] > $userOrigin->value){
            return ['ret' => 1, 'msg' => 'Transação não autorizada por falta de saldo na conta de origem']; 
        }

        $userDestiny = $this->userService->getUserByWallet($data['wallet_destiny']);
        
        //DB::transaction atuará com o rollback caso dê algum erro no processo de transação
        $infoMoney = \DB::transaction(function () use ($userOrigin, $userDestiny, $data) {
            
            $remainOriginMoney = $userOrigin->value - $data['transaction_value'];
            Wallet::find($data['wallet_origin'])->update(['value' => $remainOriginMoney]);
            Transactions::create($data);

            $remainDestinyMoney = $data['transaction_value'] + $userDestiny->value;
            Wallet::find($data['wallet_destiny'])->update(['value' => $remainDestinyMoney]);

            //mock de envio de mensagens
            $sendMessage = Index::successMessage();

            if($sendMessage != 'Success'){
                return ['ret' => 1, 'msg' => 'Transação efetivada mas e-mail não enviado']; 
            }
                            
            return ['ret' => 1, 'msg' => 'Transação efetivada com sucesso']; 
        });

        return $infoMoney ;
    }

}