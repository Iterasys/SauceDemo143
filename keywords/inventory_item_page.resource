*** Settings ***
Library    Browser
Resource    header_page.resource

*** Keywords ***
Verificar nome e preco na pagina de detalhe do produto
    [Arguments]    ${produto_esperado}    ${preco_esperado}
    ${produto_atual}    Get Text    css=div.inventory_details_name.large_size
    Should Be Equal    ${produto_atual}    ${produto_esperado}

    ${preco_atual}    Get Text    css=div.inventory_details_price
    Should Be Equal    ${preco_atual}    ${preco_esperado}

Adicionar o produto no carrinho de compras
    Click    id=add-to-cart

    ${texto_botao}    Get Text    id=remove
    Should Be Equal    ${texto_botao}    Remove
    Get Element States   id=remove    then    visible

    Verificar a quantidade de itens no icone do carrinho    1

Remover o produto do carrinho
    Click    id=remove

    ${texto_botao}    Get Text    id=add-to-cart
    Should Be Equal    ${texto_botao}    Add to cart
    Get Element States   id=add-to-cart    then    visible

    Verificar a quantidade de itens no icone do carrinho    ${EMPTY}    




