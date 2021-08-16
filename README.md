## Desafio 

Gerenciar uma aplicação onde é possível cadastrar usuários, validá-los por meio de CPF e/ou email para não gerar duplicidade de registros, além de consultar a conta corrente desse usuário, fornecendo-lhe as opções para transações bancárias.

## Começando 

Para rodar o projeto, siga os passos abaixo:

- Clone o projeto para sua área gerenciada pelo Docker (https://github.com/arianefavero/knowledge.git)
- Inicie o terminal entrando na pasta do projeto e digite composer install para instalar as dependências do Laravel
- Lembre-se de criar uma branch exclusiva para você trabalhar em sua máquina local
- Para testar as apis, utilize o Postman (http://127.0.0.1:8000/api/v1/sua_rota_aqui)
- Faça o restore do dump do banco de dados

## Tecnologias envolvidas 

- Framework Laravel e bibliotecas adicionais
- IDE VS Code e plugins
- Banco de dados MySql utilizando interface gráfica do Workbench
- Teste de rotas no Postman
- Versionamento em GitHub

## Funcionalidades apresentadas 

- Cadastro de usuário
- Validação de cadastro via email ou número de documento
- Consulta de saldo
- Transferência de valores entre usuários
- Validação de transferência entre usuários

## Anexos 

- Collection das request para Postman
- DER
- Backup banco de dados
- Casos de Uso
- Fluxograma

## Links úteis 

- Instalação Laravel (https://laravel.com/docs/8.x/installation)
- Instalação Composer (https://getcomposer.org/doc/00-intro.md)
- Instalação de bibliotecas (https://packagist.org/?query=gu)
- Uso do PHPStan (https://imasters.com.br/php/detectando-erros-no-seu-codigo-sem-executa-lo-com-phpstan)
- Download MySQL Server (https://downloads.mysql.com/archives/community/)
- Download MySQL Workbench (https://dev.mysql.com/downloads/workbench/)
