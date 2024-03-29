class CreateLines < ActiveRecord::Migration[7.1]
  def change
    create_table :lines do |t|
      t.references :lineable, polymorphic: true, null: false
      t.string :description
      t.integer :quantity
      t.decimal :unit_price
      t.decimal :total_price
      t.integer :position

      t.timestamps
    end
  end
end
