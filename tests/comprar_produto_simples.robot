*** Settings ***
Library    Browser
Resource    ../keywords/login_page.resource
Resource    ../keywords/inventory_page.resource

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
    Logar    ${username}    ${password}    Products    #Loga e checa titulo
    Verificar o produto na pagina de inventario Ancestor    ${sku}    ${produto_esperado}    ${preco_esperado}
    #Listar produtos na pagina de inventario   
*** Keywords ***
# serão todas escritas nos arquivos de mapeamento de página