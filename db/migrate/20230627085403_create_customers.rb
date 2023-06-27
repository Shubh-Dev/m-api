# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false
      t.string :phone_number
      t.string :username
      t.string :password, null: false

      t.timestamps
    end
  end
end
