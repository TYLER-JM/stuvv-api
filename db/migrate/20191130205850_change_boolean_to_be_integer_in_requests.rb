class ChangeBooleanToBeIntegerInRequests < ActiveRecord::Migration[6.0]
  def change
    remove_column :requests, :approved
    add_column :requests, :approved, :integer, default: 0
  end
  def down
    remove_column :requests, :approved
    add_column :requests, :approved, :boolean, default: false
  end
end
