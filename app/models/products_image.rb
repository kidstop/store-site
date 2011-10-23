class ProductsImage < ActiveRecord::Base
  belongs_to :image
  belongs_to :product
end