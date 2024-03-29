class CreateQuotations < ActiveRecord::Migration[7.1]
  def change
    create_table :quotations do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :number
      t.string :title
      t.integer :status, default: 0
      t.date :issue_at
      t.date :due_at
      t.decimal :subtotal, precision: 10, scale: 2
      t.decimal :discount, precision: 10, scale: 2
      t.decimal :total, precision: 10, scale: 2

      t.timestamps
    end
  end
end
