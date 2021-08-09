<?php

namespace App\Utils;

use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;
// biblioteca para integração com serviços externos


class Index
{

    //chamada ao serviço autorizador de transação
    public static function hasAuthorization()
    {
        $user_id = '8fafdd68-a090-496f-8c9a-3442cf30dae6';
        $client = new Client(['base_uri' => 'https://run.mocky.io/v3/']);
        $headers = ['Content-type' => 'application/json'];
        $response = $client->get($user_id, ['headers' => $headers]);
        $responseJson = json_decode($response->getBody()->getContents());

        return $responseJson->message;
    }

    //chamada ao serviço de envio de mensagens
    public static function successMessage()
    {
        $client = new Client(['base_uri' => 'http://o4d9z.mocklab.io']);
        $headers = ['Content-type' => 'application/json'];
        $response = $client->get('/notify',['headers' => $headers]);
        $responseJson = json_decode($response->getBody()->getContents());

        return $responseJson->message;
    }

}