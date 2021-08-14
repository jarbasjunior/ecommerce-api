class Coverage
  def path
    endpoints = [
      # Address
      '/shopper-address', '/shopper-address/{id}',
      # Auth
      '/auth',
      # KeyWords
      '/key-words',
      # Orders
      '/orders', '/orders/{id}', '/orders{id}/status',
      # Products
      '/products', '/products/{id}', '/products/images/{id}', '/products/images/{productImageid}',
      '/products/questions-answers/{idProduct}', '/products/{id}/stock',
      # Question And Answers
      '/questions-and-answers/{id}',
      # Shoppers
      '/shoppers',
      # Users
      '/users', '/users/{id}'
    ]

    endpoints_covered = [
      # Auth
      '/auth',
      # KeyWords
      '/key-words',
      # Products
      '/products', '/products/{id}'
    ]
    ((endpoints_covered.count.to_f / endpoints.count) * 100).truncate(2)
  end

  def operator
    operators = [
      # Address
      'GET /shopper-address', 'POST /shopper-address', 'PUT /shopper-address/{id}',
      # Auth
      'POST /auth',
      # KeyWords
      'GET /key-words', 'POST /key-words',
      # Orders
      'POST /orders', 'GET /orders', 'GET /orders/{id}', 'PUT /orders{id}/status',
      # Products
      'POST /products', 'GET /products', 'POST /products/images/{id}', 'DELETE /products/images/{productImageid}',
      'POST /products/questions-answers/{idProduct}', 'PUT /products/{id}', 'DELETE /products{id}',
      'GET /products{id}', 'PUT /products/{id}/stock',
      # Question And Answers
      'PUT /questions-and-answers/{id}', 'DELETE /questions-and-answers/{id}',
      # Shoppers
      'POST /shoppers', 'PUT /shoppers/{id}',
      # Users
      'POST /users', 'GET /users', 'PUT /users/{id}', 'DELETE /users/{id}', 'GET /users/{id}'
    ]

    operators_covered = [
      # Products
      'POST /products', 'GET /products{id}'
    ]

    ((operators_covered.count.to_f / operators.count) * 100).truncate(2)
  end

  def parameter
    parameters = {
      # Address
      'GET /shopper-address' => %w[authorization], 'POST /shopper-address' => %w[authorization body],
      'PUT /shopper-address/{id}' => %w[authorization id body],
      # Auth
      'POST /auth' => %w[body],
      # KeyWords
      'GET /key-words' => %w[authorization], 'POST /key-words' => %w[authorization body],
      # Orders
      'POST /orders' => %w[authorization body], 'GET /orders' => %w[authorization], 'GET /orders/{id}' => %w[authorization id],
      'PUT /orders{id}/status' => %w[authorization id body],
      # Products
      'POST /products' => %w[authorization body], 'GET /products' => %w[authorization], 'POST /products/images/{id}' => %w[authorization id body],
      'DELETE /products/images/{productImageid}' => %w[authorization productImageid],
      'POST /products/questions-answers/{idProduct}' => %w[authorization idProduct body], 'PUT /products/{id}' => %w[authorization id body],
      'DELETE /products{id}' => %w[authorization id], 'GET /products{id}' => %w[authorization id], 'PUT /products/{id}/stock' => %w[authorization id body],
      # Question And Answers
      'PUT /questions-and-answers/{id}' => %w[authorization id body], 'DELETE /questions-and-answers/{id}' => %w[authorization id],
      # Shoppers
      'POST /shoppers' => %w[authorization body], 'PUT /shoppers' => %w[authorization id body],
      # Users
      'POST /users' => %w[authorization body], 'GET /users' => %w[authorization], 'PUT /users/{id}' => %w[authorization id body],
      'DELETE /users/{id}' => %w[authorization id], 'GET /users/{id}' => %w[authorization id]
    }

    parameters_covered = {
      # Products
      'POST /products' => %w[authorization body]
    }

    t_parameters = 0
    t_parameters_covered = 0

    parameters.each { |_key, value| t_parameters += value.count }
    parameters_covered.each { |_key, value| t_parameters_covered += value.count }

    ((t_parameters_covered.to_f / t_parameters) * 100).truncate(2)
  end

  def parameter_value
    parameters_value = {
      # Orders
      'POST /orders[body]' => %w[paymentMethod], 'POST /appointments[body]' => %w[isReturn],
      # Users
      'POST /users[body]' => %w[userType]
    }
    parameters_value_covered = {}

    t_parameters_value = 0
    t_parameters_value_covered = 0

    parameters_value.each { |_key, value| t_parameters_value += value.count }
    parameters_value_covered.each { |_key, value| t_parameters_value_covered += value.count }

    ((t_parameters_value_covered.to_f / t_parameters_value) * 100).truncate(2)
  end

  def status_code
    status_code = {
      # Address
      'GET /shopper-address' => %w[200],
      'POST /shopper-address' => %w[200],
      'PUT /shopper-address/{id}' => %w[200],
      # Auth
      'POST /auth' => %w[200 400 422 500],
      # KeyWords
      'GET /key-words' => %w[200 400 401 403 422 500],
      'POST /key-words' => %w[200 400 401 403 422 522],
      # Orders
      'POST /orders' => %w[200],
      'GET /orders' => %w[200],
      'GET /orders/{id}' => %w[200],
      'PUT /orders{id}/status' => %w[200],
      # Products
      'POST /products' => %w[201 400 401 403 422 500],
      'GET /products' => %w[200 400 401 403 422 500],
      'POST /products/images/{id}' => %w[200 400 401 403 422 500],
      'DELETE /products/images/{productImageid}' => %w[200],
      'POST /products/questions-answers/{idProduct}' => %w[200 400 401 403 422 500],
      'PUT /products/{id}' => %w[200 400 401 403 422 500],
      'DELETE /products{id}' => %w[200 400 401 403 500],
      'GET /products{id}' => %w[200 400 401 403 500],
      'PUT /products/{id}/stock' => %w[200 400 401 403 422 500],
      # Question And Answers
      'PUT /questions-and-answers/{id}' => %w[200 400 401 403 500],
      'DELETE /questions-and-answers/{id}' => %w[200 400 401 403 500],
      # Shoppers
      'POST /shoppers' => %w[200],
      'PUT /shoppers/{id}' => %w[200],
      # Users
      'POST /users' => %w[200],
      'GET /users' => %w[200],
      'PUT /users/{id}' => %w[200],
      'DELETE /users/{id}' => %w[200],
      'GET /users/{id}' => %w[200]
    }

    status_code_covered = {
      # Products
      'POST /products' => %w[201 401 422]
    }

    t_status_code = 0
    t_status_code_covered = 0

    status_code.each { |_key, value| t_status_code += value.count }
    status_code_covered.each { |_key, value| t_status_code_covered += value.count }

    ((t_status_code_covered.to_f / t_status_code) * 100).truncate(2)
  end
end
