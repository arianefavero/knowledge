<?php

namespace App\Services;

use App\Models\Users;
use App\Models\Login;
use App\Models\Wallet;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Ramsey\Uuid\Uuid;


//!  Camada de regra de negócio 
/*!
  Serviço que gerencia a inserção ou consulta de dados de usuários
*/
class UserServices
{

    //Função que consulta se usuário já possui cadastro
    public function getUser($data)
    {
        $document = isset($data['document']) ? $data['document'] : null;
        $email = isset($data['email']) ? $data['email'] : null;

        $userActive = Users::select('users.id','users.document','login_user.email')
                            ->where('document', $document)
                            ->orWhere('email', $email)
                            ->join('login_user', 'users.id', '=', 'login_user.user_id')
                            ->get();

        return $userActive;
    }

    //Função que consulta saldo de usuário
    public function getUserByWallet($walletId)
    {
        return Wallet::select('wallet.id as wallet_id','wallet.user_id','wallet.value','users.document_type')->join('users','wallet.user_id','=','users.id')->where('wallet.id','=',$walletId)->first();
    }

    //Função que cria conta de usuário
    public function create($data)
    {
        $document = isset($data['document']) ? $data['document'] : null;
        $email = isset($data['email']) ? $data['email'] : null;
        $user = $this->getUser($data);
    
        if($user->isNotEmpty()){
            return ['ret' => 1, 'msg' => 'Usuário já cadastrado', 'info' => $user];
        }

        //DB::transaction atuará com o rollback caso dê algum erro no processo de criação do usuário
        $user = \DB::transaction(function () use ($data, $user) {
            
            $user = Users::create(['first_name' => $data['first_name'],'last_name' => $data['last_name'],'document' => $data['document']]);
            Login::create([ 'email' => $data['email'], 'password' => $data['password'], 'user_id' => $user->id]);
            Wallet::create(['user_id' => $user->id]);
                            
            return $user;
        });

        return ['ret' => 1, 'msg' => 'Usuário cadastrado com sucesso', 'info' => $user];
    }

}