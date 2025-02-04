*** Settings ***
Library    Browser    # Playwright
Library    DataDriver    file=../fixtures/csv/login.csv    dialect=excel    delimiter=;
Resource    ../keywords/login_page.resource
Test Template    Cenario de Compra CSV

*** Variables ***
${url}    https://www.saucedemo.com

*** Test Cases ***
TC${INDEX}     ${tipo}    ${username}    ${password}    ${resultado_esperado}   

*** Keywords ***
Cenario de Compra CSV
    [Arguments]     ${tipo}    ${username}    ${password}    ${resultado_esperado}
    login_page.Abrir o site    ${url}
    IF    "${tipo}" == "P"
        login_page.Logar    ${username}    ${password}    ${resultado_esperado}
    ELSE
        login_page.Login sem sucesso    ${username}    ${password}    ${resultado_esperado}
    END    
    
