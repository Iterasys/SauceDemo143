*** Settings ***
Library    Browser    # Playwright
Resource    ../keywords/login_page.resource
Test Template    Realizar Login

*** Variables ***
${url}    https://www.saucedemo.com

*** Test Cases ***
TCP01    standard_user       secret_sauce    Products
TCP02    visual_user         secret_sauce    Products       

*** Keywords ***
Realizar Login
    [Arguments]    ${username}    ${password}    ${resultado_esperado}
    login_page.Abrir o site    ${url}
    login_page.Logar    ${username}    ${password}    ${resultado_esperado}
    
