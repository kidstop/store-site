class RemoveImageFromProducts < ActiveRecord::Migration
  def self.up
    remove_column :products, :image_id
  end

  def self.down
    add_column :products, :image_id, :integer
  end
end
