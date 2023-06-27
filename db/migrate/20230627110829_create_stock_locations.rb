# frozen_string_literal: true

class CreateStockLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :stock_locations do |t|
      t.string :name, null: false, limit: 100
      t.text :address, null: false

      t.timestamps
    end
  end
end
