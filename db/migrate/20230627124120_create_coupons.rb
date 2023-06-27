# frozen_string_literal: true

class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.references :discount, null: false, foreign_key: true
      t.string :code, null: false, limit: 100
      t.datetime :expiry_date, null: false
      t.timestamps
    end
  end
end
