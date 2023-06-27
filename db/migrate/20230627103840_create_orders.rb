# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.datetime :date
      t.decimal :total_price
      t.string :order_type

      t.timestamps
    end
  end
end
