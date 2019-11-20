class AddDefaultValueToListings < ActiveRecord::Migration[6.0]
  def up
    change_column_default :listings, :availability, true
  end
  def down
    change_column_default :listings, :availability, nil
  end
end
