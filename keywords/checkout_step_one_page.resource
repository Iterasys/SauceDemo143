*** Settings ***
Library    Browser

*** Keywords ***
Preencher informacoes do cliente e continuar
    [Arguments]    ${firstname}    ${lastname}    ${postal-code}
    Type Text    id=first-name    ${firstname}
    Type Text    id=last-name    ${lastname}
    Type Text    id=postal-code    ${postal-code}

    Click    id=continue