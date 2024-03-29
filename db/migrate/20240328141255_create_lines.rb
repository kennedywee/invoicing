class CreateLines < ActiveRecord::Migration[7.1]
  def change
    create_table :lines do |t|
      t.references :lineable, polymorphic: true, null: false
      t.text :description
      t.integer :quantity, default: 0
      t.decimal :unit_price, precision: 10, scale: 2
      t.decimal :total_price, precision: 10, scale: 2
      t.integer :position

      t.timestamps
    end
  end
end
