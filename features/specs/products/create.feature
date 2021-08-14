# language: pt
Funcionalidade: Cadastrar produto

  Contexto:
    Dado que tenho token de administrador

  Cenário: Cadastrar produto com sucesso
    Quando cadastro um produto com a requisição POST para /products
    Então valido resposta da API para o cadastro de produto
    E verifico se produto está sendo listado

  Cenário: Não cadastrar produto sem enviar token na requisição
    Quando tento cadastrar um produto com a requisição POST para /products sem o token
    Então valido resposta da API de proibição de cadastro de produto sem token

  Cenário: Não cadastrar produto com keyword inválida
    Quando tento cadastrar um produto com a requisição POST para /products com keyword inválida
    Então valido resposta da API de proibição de cadastro de produto com keyword inválida

  Cenário: Cadastrar produto novamente com mesmo nome após sua exclusão
    Dado que é removido um produto
    Quando cadastro um produto com a requisição POST para /products com o mesmo nome do excluído
    Então valido resposta da API para o cadastro de produto
    E verifico se produto está sendo listado