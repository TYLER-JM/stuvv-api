class AddMessageRefToRequests < ActiveRecord::Migration[6.0]
  def change
    add_reference :requests, :message, null: false, foreign_key: true, default: 1
  end
end
