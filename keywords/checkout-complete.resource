*** Settings ***
Library    Browser

*** Keywords ***
Verificar a mensagem de agradecimento
    ${mensagem_atual}    Get Text    css=h2.complete-header
    Should Be Equal    ${mensagem_atual}    Thank you for your order!

Clicar no botao Back Home
    Click    id=back-to-products