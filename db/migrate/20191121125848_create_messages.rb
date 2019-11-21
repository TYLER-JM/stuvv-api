class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.json :conversation
      t.boolean :read, default: false
      t.references :to_user, foreign_key: { to_table: 'users' }
      t.references :from_user, foreign_key: { to_table: 'users' }
      t.timestamps
    end
  end
end
