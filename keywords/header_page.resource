*** Settings ***
Library    Browser
Library    ../fixtures/variables/variaveis.py

*** Keywords ***
Verificar a quantidade de itens no icone do carrinho    
    [Arguments]    ${quantidade_esperada}
    ${quantidade_atual}    Get Text    css=a.shopping_cart_link
    Should Be Equal    ${quantidade_atual}    ${quantidade_esperada}    

Ir para o carrinho
    Click    css=a.shopping_cart_link

Confirmar ser a pagina de destino
    [Arguments]    ${pagina}    ${titulo_esperado}
    #To Do: Validar a url
    ${url_atual}    Get Url
    ${url_esperado}    Get Variavel    URL    ${None}
    Should Be Equal    ${url_atual}    ${url_esperado}/${pagina}.html

    # Espera pelo elemento "Nome da Seção" e verifica se está escrito Products
    Wait For Elements State         css=span.title    visible    5000ms
    ${titulo_atual}          Get Text     css=span.title
    Should Be Equal    ${titulo_atual}    ${titulo_esperado}