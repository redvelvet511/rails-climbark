class AddAddressToAreas < ActiveRecord::Migration[7.0]
  def change
    add_column :areas, :address, :string
  end
end
