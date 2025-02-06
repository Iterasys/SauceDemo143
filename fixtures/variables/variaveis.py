# Variaveis globais do projeto
# Util em projetos executado em uma mesma máquina/instancia
# Não recomendado para automações distribuidas
class variaveisGlobais:
    valores = {
        "URL": "https://www.saucedemo.com",
        "SKU": ""
    }
def set_variavel(chave, valor):
    variaveisGlobais.valores[chave] = valor

def get_variavel(chave, valor):
    return variaveisGlobais.valores.get(chave, None)