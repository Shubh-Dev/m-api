# frozen_string_literal: true

class CreateCustomerAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_addresses do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :address
      t.string :address_type

      t.timestamps
    end
  end
end
