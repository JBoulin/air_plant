class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.string "name", null: false
      t.text "description", null: false
      t.float "price", null: false
      t.timestamps
    end
    add_foreign_key "users", "offers"
  end
end
