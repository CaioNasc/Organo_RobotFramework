*** Settings ***

Resource         ../resources/main.robot
Test Setup        Dado que eu acesse o Organo
Test Teardown     Fechar o navegador

*** Test Cases ***
Verificar se quando um campo obrigatório não for preenchido corretamente o sistema 
    Dado que eu clique no botão criar card
    Então o sistema deve apresentar mensagem de campo obrigatório

Abrir o navegador 

    Open Browser    url=http://localhost:3000/     browser=Chrome


