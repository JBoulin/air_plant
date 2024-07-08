class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|

      t.timestamps
    end
  end
end
