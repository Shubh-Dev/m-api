# frozen_string_literal: true

class CreateVouchers < ActiveRecord::Migration[7.0]
  def change
    create_table :vouchers do |t|
      t.string :code
      t.decimal :value

      t.timestamps
    end
  end
end
