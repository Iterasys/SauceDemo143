*** Settings ***
Library    Browser    # Playwright

*** Variables ***
${url}    https://www.saucedemo.com
${username}    standard_user
${password}    secret_sauce

*** Test Cases ***
Cenario de Compra
    Abrir o site
    Logar

*** Keywords ***
Abrir o Site
    New Browser    browser=chromium   headless=${False}    # o navegador estará visivel
    New Page    ${url}
    Wait For Elements State    id=login-button    visible    5000ms

Logar
    Click    id=user-name
    Fill Text    id=user-name    ${username}
    Click    xpath=/html/body/div[1]/div/div[2]/div[1]/div/div/form/div[2]/input
    Fill Text    xpath=/html/body/div[1]/div/div[2]/div[1]/div/div/form/div[2]/input 
    ...          ${password}    
    # Click    css=input.submit-button.btn_action
    Click    css=.btn_action

    #To Do: Validar a url
    ${url_atual}    Get Url
    Should Be Equal    ${url_atual}    ${url}/inventory.html

    # Espera pelo elemento "Nome da Seção" e verifica se está escrito Products
    Wait For Elements State         css=span.title    visible    5000ms
    ${titulo}          Get Text     css=span.title
    Should Be Equal    ${titulo}    Products

    Wait For Load State    load    
    
    Sleep    4s 