class ProductModel
  attr_accessor :name, :quantity, :keyWords, :price, :description

  def to_hash
    {
      name: @name,
      quantity: @quantity,
      keyWords: [
        @keyWords
      ],
      price: @price,
      description: @description
    }
  end
end
