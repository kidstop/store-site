class CreateProductsImages < ActiveRecord::Migration
  def self.up
    create_table :products_images do |t|
      t.integer :product_id
      t.integer :image_id
      t.integer :position
      t.string :chunk

      t.timestamps
    end
  end

  def self.down
    drop_table :products_images
  end
end