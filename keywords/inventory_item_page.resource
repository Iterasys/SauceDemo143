*** Settings ***
Library    Browser

*** Keywords ***
Verificar nome e preco na pagina de detalhe do produto
    [Arguments]    ${produto_esperado}    ${preco_esperado}
    ${produto_atual}    Get Text    css=div.inventory_details_name.large_size
    Should Be Equal    ${produto_atual}    ${produto_esperado}

    ${preco_atual}    Get Text    css=div.inventory_details_price
    Should Be Equal    ${preco_atual}    ${preco_esperado}

Adicionar o produto no carrinho de compras
    Click    id=add-to-cart

Remover o produto do carrinho
    Click    id=remove