class AddCostToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :cost, :string
  end

  def self.down
    remove_column :products, :cost
  end
end
