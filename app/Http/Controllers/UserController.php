<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Users;
use App\Models\Login;
use App\Services\UserServices;
use App\Http\Requests\UserRequest;



class UserController extends Controller
{

    private $userService;

    public function __construct()
    {
        $this->userService = new UserServices;
    }

    // Retorna todos os usuários
    public function index(Request $request)
    {
        return Users::all();
    }

    // Retorna usuário passando documento ou email
    public function getUser(Request $request)
    {
        try{
            $data = $request->all();
            $user = $this->userService->getUser($data);

            if(isset($user) && count($user) >= 1){
                return response()->json(['ret' => 1, 'msg' => 'Parabéns, você já é um felizardo P', 'info' => $user] , 200);
            } else {
                return response()->json(['ret' => 0, 'msg' => 'Você ainda não é um felizardo P... Cadastre-se e tenha um mundo de vantagens!'], 401);
            }

        } catch (\Exception $e){
            return response()->json(['ret' => 0, 'msg' => 'Erro ao pesquisar usuário', 'erro' => $e->getMessage()], 500);
        }
    }

    // Função que gerencia a inserção de um novo usuário
    public function insertUser(UserRequest $request)
    {
        try{
            $data = $request->all();
            $response = $this->userService->create($data);

            return response()->json($response, 201);

        } catch (\Exception $e){
            return response()->json(['ret' => 0, 'msg' => 'Erro ao pesquisar usuário', 'erro' => $e->getMessage()], 500);
        }
    }

}
