FactoryBot.define do
  factory :create_product, class: ProductModel do
    name { Faker::Commerce.product_name }
    quantity { Faker::Number.number(digits: 2) }
    keyWords { nil }
    price { Faker::Commerce.price(range: 0..100.0) }
    description { "Description of product [#{name}]" }
  end
end
