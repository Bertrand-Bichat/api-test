class AddInfoToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :type, :string
    add_column :restaurants, :description, :string
  end
end
