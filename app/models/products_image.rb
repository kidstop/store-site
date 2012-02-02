# == Schema Information
#
# Table name: products_images
#
#  id         :integer         not null, primary key
#  product_id :integer
#  image_id   :integer
#  position   :integer
#  chunk      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ProductsImage < ActiveRecord::Base
  belongs_to :image
  belongs_to :product
end
