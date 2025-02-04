*** Settings ***
Library    Browser

*** Keywords ***
Verificar o produto na pagina de inventario v1
    [Arguments]    ${sku}    ${produto_esperado}    ${preco_esperado}
    # Nome do Produto
    ${selector}    Set Variable    item_${sku}_title_link
    ${produto_atual}    Get Text    id=${selector}
    Should Be Equal    ${produto_atual}    ${produto_esperado}
    # Preço do Produto
    ${preco_atual}    Get Text    xpath=//*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div    #fixa/viciada
    Should Be Equal    ${preco_atual}     ${preco_esperado}

Verificar preco do produto na pagina de inventario For
    [Arguments]    ${sku}    ${produto_esperado}    ${preco_esperado}
    # Ler e obter as listas de produtos e preços
    ${produtos}    Get Elements    css=div.inventory_item_name
    ${precos}      Get Elements    css=div.inventory_item_price 

    # Verificar se as listas tem o mesmo tamanho
    Should Be Equal As Integers    ${produtos.__len__()}    ${precos.__len__()}    Listas de tamanhos diferentes

    FOR    ${index}    IN RANGE    0    ${produtos.__len__()}
        ${nome_produto}    Get Text    ${produtos}[${index}]
        ${preco_produto}    Get Text    ${precos}[${index}]
        Log To Console    ${nome_produto} | ${preco_produto}

        IF    '${nome_produto}' == '${produto_esperado}'
               Should Be Equal    ${preco_produto}    ${preco_esperado} 
               Exit For Loop       
        END       
    END

Verificar o produto na pagina de inventario Ancestor
    [Arguments]    ${sku}    ${produto_esperado}    ${preco_esperado}
    # Verifica o produto
    ${produto_atual}    Get Text    
    ...    xpath=//div[@data-test='inventory-item-name' and text()='${produto_esperado}']
    Should Be Equal    ${produto_atual}    ${produto_esperado}

    # Verifica o preço
    ${selector}    Set Variable    item_${sku}_title_link
    ${preco_atual}    Get Text    
    ...    xpath=//a[@id='${selector}']/ancestor::div[@class='inventory_item_description']//div[@class='inventory_item_price']
    Should Be Equal    ${preco_atual}    ${preco_esperado}

