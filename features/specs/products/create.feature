# language: pt
Funcionalidade: Cadastrar produto

  Cenário: Cadastrar produto com sucesso
    Dado que tenho token de administrador
    Quando cadastro um produto com a requisição POST para /products
    Então valido resposta da API para o cadastro de produto
    E verifico se produto está sendo listado

  Cenário: Não cadastrar produto sem enviar token na requisição
    Dado que tenho token de administrador
    Quando tento cadastrar um produto com a requisição POST para /products sem o token
    Então valido resposta da API de proibição de cadastro de produto
