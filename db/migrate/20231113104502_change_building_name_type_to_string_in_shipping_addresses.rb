class ChangeBuildingNameTypeToStringInShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    change_column :shipping_addresses, :building_name, :string
  end
end
