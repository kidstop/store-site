class Product < ActiveRecord::Base

	has_many :products_images
	has_many :images, :through => :products_images

	def images_attributes=(data)
      ProductsImage.delete_all(:product_id => self.id)
      data.each_with_index do | ( k, image_data ), i |
        if image_data['id'].present?
          image_gallery = self.products_images.new(
                                                          :image_id => image_data['id'].to_i, 
                                                          :position => i, 
                                                          :chunk => image_data['chunk'], 
                                                          
                                                        )
          self.products_images << image_gallery
        end
        self.touch
      end
    end

  acts_as_indexed :fields => [:title, :description, :style_number]

  validates :title,         :presence => true, :uniqueness => true
  validates :description,   :presence => true
  validates :price,         :presence => true, :numericality => true
  validates :category,      :presence => true
  validates :style_number,  :presence => true, :uniqueness => true
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