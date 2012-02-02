# == Schema Information
#
# Table name: products
#
#  id              :integer         not null, primary key
#  title           :string(255)
#  description     :text
#  kidstop_price   :decimal(, )
#  category        :integer
#  style_number    :string(255)
#  position        :integer
#  created_at      :datetime
#  updated_at      :datetime
#  retail_price    :decimal(, )
#  clearance_price :decimal(, )
#  cost            :string(255)
#

class Product < ActiveRecord::Base
  attr_accessible :title,
                  :description,
                  :kidstop_price,
                  :retail_price,
                  :clearance_price,
                  :cost,
                  :category,
                  :style_number,
                  :position,
                  :images,
                  :images_attributes
  
  acts_as_indexed :fields => [:title, :description, :style_number]

  validates :title,         :presence => true
  validates :description,   :presence => true
  validates :cost,          :presence => true
  validates :retail_price,  :presence => true, :numericality => true
  validates :kidstop_price, :presence => true, :numericality => true
  validates :category,      :presence => true
  validates :style_number,  :presence => true, :uniqueness => true

	has_many :products_images
	has_many :images, :through => :products_images

  def primary_image
    self.images.joins(:products_images).order('products_images.position ASC').first
  end
  
  def ordered_images
    self.images.joins(:products_images).order('products_images.position ASC')
  end

	def images_attributes=(data)
    ProductsImage.delete_all(:product_id => self.id)
    data.each_with_index do | ( k, image_data ), i |
      if image_data['id'].present?
        image_gallery = self.products_images.new( :image_id => image_data['id'].to_i, 
                                                  :position => i, 
                                                  :chunk => image_data['chunk'])
        self.products_images << image_gallery
      end
      self.touch
    end
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
