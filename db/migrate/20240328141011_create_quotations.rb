class CreateQuotations < ActiveRecord::Migration[7.1]
  def change
    create_table :quotations do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :number
      t.integer :status
      t.date :issue_at
      t.date :due_at

      t.timestamps
    end
  end
end
