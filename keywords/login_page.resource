*** Settings ***
Library    Browser

*** Keywords ***
Abrir o Site
    [Arguments]    ${url}
    New Browser    browser=chromium   headless=${False}    # o navegador estará visivel
    New Page    ${url}
    Set Suite Variable    ${url}
    Wait For Elements State    id=login-button    visible    5000ms

Logar
    [Arguments]    ${username}    ${password}
    Click    id=user-name
    Fill Text    id=user-name    ${username}
    Click    xpath=/html/body/div[1]/div/div[2]/div[1]/div/div/form/div[2]/input
    Fill Text    xpath=/html/body/div[1]/div/div[2]/div[1]/div/div/form/div[2]/input 
    ...          ${password}    
    # Click    css=input.submit-button.btn_action
    Click    css=.btn_action

    Wait For Load State    load  

    Sleep    5s 

Login sem sucesso
    [Arguments]    ${username}    ${password}    ${resultado_esperado}
    IF    "${username}" != "_branco"
        Click    id=user-name
        Fill Text    id=user-name    ${username}
    END
    IF    "${password}" != "_branco"
        Click    xpath=/html/body/div[1]/div/div[2]/div[1]/div/div/form/div[2]/input
        Fill Text    xpath=/html/body/div[1]/div/div[2]/div[1]/div/div/form/div[2]/input 
        ...          ${password}  
    END
  
    # Click    css=input.submit-button.btn_action
    Click    css=.btn_action

    ${url_atual}    Get Url
    Should Be Equal    ${url_atual}    ${url}/

    # Espera o botão Login estar visivel
    Wait For Elements State         css=.btn_action    visible    5000ms
 
    # O que importa mesmo é
    # Verificar se é a mensagem de erro esperada


    ${resultado_atual}    Get Text    css=h3
    Should Contain    ${resultado_atual}        ${resultado_esperado}

    Sleep    5s   