class Product < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :description, :style_number]

  validates :title,         :presence => true, :uniqueness => true
  validates :description,   :presence => true
  validates :price,         :presence => true, :numericality => true
  validates :category,      :presence => true
  validates :style_number,  :presence => true, :uniqueness => true
  
  def clearance_price?
    !@product.clearance_price.nil? && @product.clearance_price > 0
  end
end

Product_Categories = {
  :Formal_Wear => 1,
  :Dressy => 2,
  :Sportswear => 3,
  :School_Uniforms => 4,
  :First_Communion => 5,
  :Christening => 6,
  :Infants => 7,
  :Accessories => 8,
  :Hairpieces => 9,
  :Clearance => 10
}