# frozen_string_literal: true

class CreateProductVariations < ActiveRecord::Migration[7.0]
  def change
    create_table :product_variations do |t|
      t.references :product, null: false, foreign_key: true
      t.string :name, null: false, limit: 100
      t.string :value

      t.timestamps
    end
  end
end
