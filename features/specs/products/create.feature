# language: pt
Funcionalidade: Cadastrar produto

  Cenário: Cadastrar produto com sucesso
    Dado que tenho token de administrador
    Quando cadastro um produto com a requisição POST para /products
    Então valido resposta da API para o cadastro de produto
    E verifico se produto está sendo listado
