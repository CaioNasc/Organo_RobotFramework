*** Settings ***


Resource         ../resources/main.robot
Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador


*** Test Cases ***
Verificar se ao preencher o formulário os dados estão sendo inseridos corretamente
  Dado que eu preencha os campos do formulário
  E clique no botão criar card
  Então identificar o card no time esperado

Verificar se é possível criar mais de um card dentro das equipes
    Dado que eu preencha os campos do formulário
    E clique no botão criar card
    Então identificar 3 cards no time esperado

Verificar se é possível criar um card para cada time disponível se preenchermos os campos corretamente
    Dado que eu preencha os campos do formulário
    Então criar e identificar 1 card em cada time disponível
