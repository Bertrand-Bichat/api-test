class RemoveTypeFromRestaurant < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :type, :string
  end
end
