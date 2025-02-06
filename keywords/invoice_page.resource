*** Settings ***
Library    Browser

*** Keywords ***
Verificar quantidade nome e preco do produto
    [Arguments]    ${quantidade_esperado}    ${produto_esperado}    ${preco_esperado}
    
    ${quantidade_atual}    Get Text    css=div.cart_quantity
    Should Be Equal    ${quantidade_atual}    ${quantidade_esperado}

    ${produto_atual}    Get Text    css=div.inventory_item_name
    Should Be Equal    ${produto_atual}    ${produto_esperado}

    ${preco_atual}    Get Text    css=div.inventory_item_price
    Should Be Equal    ${preco_atual}    ${preco_esperado}