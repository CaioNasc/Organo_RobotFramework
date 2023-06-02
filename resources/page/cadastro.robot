*** Settings ***

Resource    ../main.robot

*** Variables ***

${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
@{SELECIONAR_TIMES}
    ...   //option[contains(.,'Programação')]
    ...   //option[contains(.,'Front-End')]
    ...   //option[contains(.,'Data Science')]
    ...   //option[contains(.,'Devops')] 
    ...   //option[contains(.,'UX e Design')]
    ...   //option[contains(.,'Mobile')]
    ...   //option[contains(.,'Inovação e Gestão')]
    
*** Keywords ***


Dado que eu preencha os campos do formulário
  ${NOME}        FakerLibrary.First Name    
  Input Text     ${CAMPO_NOME}    ${NOME}
  ${CARGO}        FakerLibrary.Job
  Input Text     ${CAMPO_CARGO}   ${CARGO}
  ${IMAGEM}      FakerLibrary.Image URL
  Input Text     ${CAMPO_IMAGEM}  ${IMAGEM}
  Click Element  ${CAMPO_TIME} 
  Click Element  ${SELECIONAR_TIMES}[0]
E clique no botão criar card
  Click Element  ${BOTAO_CARD}
  Sleep    5s
Então identificar o card no time esperado
  Element Should Be Visible    class:colaborador

Então identificar 3 cards no time esperado
    FOR    ${i}    IN RANGE    1    3    
        Dado que eu preencha os campos do formulário
        E clique no botão criar card
    END
    Sleep    10s

 Então criar e identificar 1 card em cada time disponível
    FOR    ${INDICE}  ${TIME}    IN ENUMERATE    @{SELECIONAR_TIMES}
        Dado que eu preencha os campos do formulário
        Click Element    ${TIME}
        E clique no botão criar card
    END

Dado que eu clique no botão criar card
    Click Element    ${BOTAO_CARD}

Então o sistema deve apresentar mensagem de campo obrigatório
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro