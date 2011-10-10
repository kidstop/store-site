class Product < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :description, :style_number]

  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :image
end
