<?php

namespace App\Http\Controllers;

use App\Models\Wallet;
// Carbon - Biblioteca pra formatação de datas
use Carbon\Carbon;
use Illuminate\Http\Request;



class WalletController extends Controller
{

    // Consulta Saldo do usuário
    public function index(Request $request)
    {
        try{
            $data = $request->all();
            $userActive = Wallet::where('user_id', $data['user_id'])->first();
            $msg = 'Saldo em '.  Carbon::now('America/Sao_Paulo')->format('d/m/Y H:i:s').  ' e de R$ ' . $userActive['value'];
            
            return response()->json(['ret' => 1, 'msg' => $msg], 200);

        } catch (\Exception $e){
            return response()->json(['ret' => 0, 'msg' => 'Erro ao consultar saldo do usuário', 'erro' => $e->getMessage()], 500);
        }
    }

}
