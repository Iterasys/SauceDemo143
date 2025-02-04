*** Settings ***
Library    Browser    # Playwright
Resource    ../keywords/login_page.resource
Test Template    Realizar Login

*** Variables ***
${url}    https://www.saucedemo.com

*** Test Cases ***
TCN01    standard_user       laranja    Epic sadface: Username and password do not match any user in this service
TCN02    admin       secret_sauce       Epic sadface: Username and password do not match any user in this service
TCN03    admin       laranja            Epic sadface: Username and password do not match any user in this service
TCN04    standard_us    _branco         Epic sadface: Password is required
TCN05    _branco    secret_sauce        Epic sadface: Username is required
TCN06    _branco    _branco             Epic sadface: Username is required
TCN07    admin    _branco               Epic sadface: Password is required
TCN08    _branco    laranja             Epic sadface: Username is required
TCN09    locked_out_user    secret_sauce    Epic sadface: Sorry, this user has been locked out.

*** Keywords ***
Realizar Login
    [Arguments]    ${username}    ${password}    ${resultado_esperado}
    login_page.Abrir o site    ${url}
    login_page.Login sem sucesso    ${username}    ${password}    ${resultado_esperado}
    
