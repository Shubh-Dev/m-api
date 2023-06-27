# frozen_string_literal: true

class CreateProductStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :product_stocks do |t|
      t.references :stock_location, null: false, foreign_key: true
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
