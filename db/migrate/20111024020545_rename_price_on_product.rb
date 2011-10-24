class RenamePriceOnProduct < ActiveRecord::Migration
  def self.up
    rename_column :products, :price, :kidstop_price
  end

  def self.down
    rename_column :products, :kidstop_price, :price
  end
end
