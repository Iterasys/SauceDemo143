*** Settings ***
Library    Browser
Library    decimal

*** Keywords ***
Verificar informacoes de pagamento entrega e finalizar a compra
    [Arguments]    ${payment_esperado}    ${shipping_esperado}    
    ...      ${item_total_esperado}    ${tax_percent}
    
    ${payment_atual}    Get Text    xpath=(//div[@class='summary_value_label'])[1]
    Should Be Equal    ${payment_atual}    ${payment_esperado} 

    ${shipping_atual}   Get Text    xpath=(//div[@class='summary_value_label'])[2]
    Should Be Equal    ${shipping_atual}    ${shipping_esperado}
    
    ${item_total_atual}     Get Text    css=div.summary_subtotal_label
    Should Be Equal    ${item_total_atual}    Item total: ${item_total_esperado} 
 
    ${tax_atual}    Get Text    css=div.summary_tax_label
    ${tax_atual_arredondada}    Set Variable    ${tax_atual}[6:]
    ${tax_atual_float}    Evaluate    float(${tax_atual_arredondada})
    Log To Console    tax_atual_arredondada: ${tax_atual_arredondada} 

    ${tax_esperada}    Set Variable    float(${item_total_esperado}[1:]) * float(${tax_percent})
    ${tax_esperada_arredondada}    Evaluate    round(${tax_esperada}, 2)
    
    Log To Console    tax_atual_float: ${tax_atual_float}
    Log To Console    tax_esperada_arredondada: ${tax_esperada_arredondada} 


    Should Be Equal    Tax: $${tax_atual_float}    Tax: $${tax_esperada_arredondada}
    
    
    # ${tax_esperada}    Evaluate    decimal.Decimal("${item_total_esperado}[1:]") * decimal.Decimal("${tax_percent}")    modules=decimal 
    # ${tax_arredondada}    Evaluate    ${tax_esperada}.quantize(decimal.Decimal("0.01"), rounding=ROUND_HALF_UP)    modules=decimal
    

    # To Do - ajustar o calculo de decimal / arredondamento
       
    ${total_atual}    Get Text    css=div.summary_total_label
   
    ${total_esperado}    Evaluate    float(${item_total_esperado}[1:]) + float(${tax_esperada_arredondada})
    ${total_esperado_arredondado}    Evaluate    round(${total_esperado}, 2)
    Should Be Equal    ${total_atual}    Total: $${total_esperado_arredondado}

    Click    id=finish