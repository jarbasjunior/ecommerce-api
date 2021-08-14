Dado('que tenho token de administrador') do
  @token = $stdin.call(ApiEcommerce).auth({ email: ENV['USER_ADMIN'], senha: ENV['PASS_USER_ADMIN'] })['data']['token']
end

Quando('cadastro um produto com a requisição POST para /products') do
  @body = FactoryBot.build(:create_product).to_hash
  $stdin.call(ApiEcommerce).create_keyword({ word: Faker::Lorem.word }, @token)
  keywords = $stdin.call(ApiEcommerce).keywords(@token)
  @body[:keyWords][0] = keywords['data'].last['id']
  @result = $stdin.call(ApiEcommerce).create_product(@body, @token)
end

Quando('tento cadastrar um produto com a requisição POST para /products sem o token') do
  @body = FactoryBot.build(:create_product).to_hash
  $stdin.call(ApiEcommerce).create_keyword({ word: Faker::Lorem.word }, @token)
  keywords = $stdin.call(ApiEcommerce).keywords(@token)
  @body[:keyWords][0] = keywords['data'].last['id']
  @result = $stdin.call(ApiEcommerce).create_product_without_token(@body)
end

Quando('tento cadastrar um produto com a requisição POST para /products com keyword inválida') do
  @body = FactoryBot.build(:create_product).to_hash
  $stdin.call(ApiEcommerce).create_keyword({ word: Faker::Lorem.word }, @token)
  keywords = $stdin.call(ApiEcommerce).keywords(@token)
  @body[:keyWords][0] = keywords['data'].last['id'].reverse
  @result = $stdin.call(ApiEcommerce).create_product_without_token(@body)
end

Então('valido resposta da API para o cadastro de produto') do
  expect(@result['success']).to    be_truthy
  expect(@result['errors']).to     be_empty
  expect(@result.response.code).to eql '201'
end

Então('valido resposta da API de proibição de cadastro de produto sem token') do
  expect(@result.response.code).to eql '401'
  expect(@result['success']).to    be_falsey
  expect(@result['errors']).not_to be_empty
end

Então('valido resposta da API de proibição de cadastro de produto com keyword inválida') do
  expect(@result.response.code).to eql '422'
  expect(@result['success']).to    be_falsey
  expect(@result['errors']).not_to be_empty
end

Então('verifico se produto está sendo listado') do
  @result = $stdin.call(ApiEcommerce).products(@token, { name: @body[:name] })['data']['itens'][0]
  expect(@result['id']).to                   be_an_instance_of(String)
  expect(@result['id']).not_to               be_nil
  expect(@result['name']).to                 eql @body[:name]
  expect(@result['isAvailable']).to          be_truthy
  expect(@result['quantity']).to             eql @body[:quantity]
  expect(@result['price']).to                eql @body[:price]
  expect(@result['keyWords'][0]['id']).to    eql @body[:keyWords][0]
  expect(@result['links']).to                be_empty
  expect(@result['questionAndAnswers']).to   be_empty
end
