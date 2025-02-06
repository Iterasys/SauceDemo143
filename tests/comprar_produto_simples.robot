*** Settings ***
Library    Browser
Resource    ../keywords/login_page.resource
Resource    ../keywords/inventory_page.resource
Resource    ../keywords/inventory_item_page.resource
Resource    ../keywords/header_page.resource
Resource    ../keywords/cart_page.resource
Resource    ../keywords/checkout_step_one_page.resource
Resource    ../keywords/invoice_page.resource
Resource    ../keywords/checkout_step_two_page.resource

*** Variables ***
${url}    https://www.saucedemo.com
${username}    standard_user
${password}    secret_sauce

# ${sku}    4
# ${produto_esperado}    Sauce Labs Backpack
# ${preco_esperado}      $29.99

${sku}    0
${produto_esperado}    Sauce Labs Bike Light
${preco_esperado}      $9.99

*** Test Cases ***
Cenario de Compra
    Abrir o Site    ${url}
    Logar    ${username}    ${password}  # Realiza o login
    Confirmar ser a pagina de destino    inventory    Products    # Valida url e titulo
    Verificar o produto na pagina de inventario Ancestor    ${sku}    ${produto_esperado}    ${preco_esperado}
    Selecionar o produto    sku    ${sku}    ${url}
    # Selecionar o produto    nome    ${produto_esperado}    ${url}
    Verificar nome e preco na pagina de detalhe do produto    ${produto_esperado}    ${preco_esperado}
    Adicionar o produto no carrinho de compras
    # Remover o produto do carrinho
    Ir para o carrinho
    Confirmar ser a pagina de destino    cart    Your Cart
    Verificar quantidade nome e preco do produto    1    ${produto_esperado}    ${preco_esperado}    
    Ir para o Checkout
    Confirmar ser a pagina de destino    checkout-step-one    Checkout: Your Information
    Preencher informacoes do cliente e continuar    Jose    Correia    01100
    Confirmar ser a pagina de destino    checkout-step-two    Checkout: Overview
    Verificar quantidade nome e preco do produto    1    ${produto_esperado}    ${preco_esperado}    
    Verificar informacoes de pagamento entrega e finalizar a compra    
    ...    SauceCard #31337    Free Pony Express Delivery!    
    ...    ${preco_esperado}   0.08
    Confirmar ser a pagina de destino    checkout-complete    Checkout: Complete! 
*** Keywords ***
# serão todas escritas nos arquivos de mapeamento de página