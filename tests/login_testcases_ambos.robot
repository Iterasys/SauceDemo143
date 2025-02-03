*** Settings ***
Library    Browser    # Playwright
Resource    ../keywords/login_page.resource
Test Template    Cenario de Compra

*** Variables ***
${url}    https://www.saucedemo.com

*** Test Cases ***
TCP01    P    standard_user       secret_sauce    Products
TCP02    P    visual_user         secret_sauce    Products  
TCN01    N    standard_user       laranja    Epic sadface: Username and password do not match any user in this service
TCN02    N    admin       secret_sauce       Epic sadface: Username and password do not match any user in this service
TCN03    N    admin       laranja            Epic sadface: Username and password do not match any user in this service
TCN04    N    standard_us    _branco         Epic sadface: Password is required
TCN05    N    _branco    secret_sauce        Epic sadface: Username is required
TCN06    N    _branco    _branco             Epic sadface: Username is required
TCN07    N    admin    _branco               Epic sadface: Password is required
TCN08    N    _branco    laranja             Epic sadface: Username is required
TCN09    N    locked_out_user    secret_sauce    Epic sadface: Sorry, this user has been locked out.

*** Keywords ***
Cenario de Compra
    [Arguments]    ${tipo}    ${username}    ${password}    ${resultado_esperado}
    login_page.Abrir o site    ${url}
    IF    "${tipo}" == "P"
        login_page.Logar    ${username}    ${password}    ${resultado_esperado}
    ELSE
        login_page.Login sem sucesso    ${username}    ${password}    ${resultado_esperado}
    END    
    
