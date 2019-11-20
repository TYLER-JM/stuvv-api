class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.integer :price_per_day
      t.boolean :availability

      t.timestamps
    end
  end
end
