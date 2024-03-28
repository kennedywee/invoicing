class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone_no
      t.string :email
      t.text :address
      t.string :company

      t.timestamps
    end
  end
end
