class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :price, null: false
      t.integer :number, null: false
      t.integer :unit_price, null: false
      t.string  :text
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
