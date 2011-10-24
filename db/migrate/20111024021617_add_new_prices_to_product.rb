class AddNewPricesToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :retail_price, :decimal
    add_column :products, :clearance_price, :decimal
  end

  def self.down
    remove_column :products, :clearance_price
    remove_column :products, :retail_price
  end
end
