class ApiEcommerce
  include HTTParty
  base_uri ENV['URI']
  headers  JSON.parse(ENV['HEADER'])

  def auth(body)
    self.class.post('/auth', body: body.to_json)
  end

  def create_keyword(body, token)
    header = JSON.parse(ENV['HEADER']).merge!({ ENV['HEADER_TOKEN'] => "#{ENV['HEADER_TOKEN_VALUE']}#{token}" })
    self.class.post('/key-words', headers: header, body: body.to_json)
  end

  def keywords(token)
    header = JSON.parse(ENV['HEADER']).merge!({ ENV['HEADER_TOKEN'] => "#{ENV['HEADER_TOKEN_VALUE']}#{token}" })
    self.class.get('/key-words', headers: header)
  end

  def create_product(body, token)
    header = JSON.parse(ENV['HEADER']).merge!({ ENV['HEADER_TOKEN'] => "#{ENV['HEADER_TOKEN_VALUE']}#{token}" })
    self.class.post('/products', headers: header, body: body.to_json)
  end

  def create_product_without_token(body)
    self.class.post('/products', body: body.to_json)
  end

  def products(token, filters)
    header = JSON.parse(ENV['HEADER']).merge!({ ENV['HEADER_TOKEN'] => "#{ENV['HEADER_TOKEN_VALUE']}#{token}" })
    self.class.get('/products', query: filters, headers: header)
  end
end
