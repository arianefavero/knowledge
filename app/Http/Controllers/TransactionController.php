<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Transactions;
use App\Http\Requests\TransactionRequest;
use App\Services\TransactionService;
use App\Models\Wallet;



class TransactionController extends Controller
{

    private $transactionService;

    public function __construct()
    {
        $this->transactionService = new TransactionService;
    }

    // Função que controla o processo de transferência
    public function transfer(TransactionRequest $request)
    {
        try{
            $data = $request->all();
            $response = $this->transactionService->transf($data);

            return response()->json($response, 200);

        } catch (\Exception $e){
            return response()->json(['ret' => 0, 'msg' => 'Erro ao fazer a transferência', 'erro' => $e->getMessage()], 500);
        }
    }

}
