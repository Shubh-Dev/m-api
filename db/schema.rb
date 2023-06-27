# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_627_125_515) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'coupons', force: :cascade do |t|
    t.bigint 'discount_id', null: false
    t.string 'code', limit: 100, null: false
    t.datetime 'expiry_date', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['discount_id'], name: 'index_coupons_on_discount_id'
  end

  create_table 'customer_addresses', force: :cascade do |t|
    t.bigint 'customer_id', null: false
    t.string 'address'
    t.string 'address_type'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['customer_id'], name: 'index_customer_addresses_on_customer_id'
  end

  create_table 'customers', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email'
    t.string 'phone_number'
    t.string 'username'
    t.string 'password'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'discounts', force: :cascade do |t|
    t.string 'name', null: false
    t.decimal 'percentage', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'order_discounts', force: :cascade do |t|
    t.bigint 'order_id', null: false
    t.bigint 'discount_id', null: false
    t.bigint 'coupon_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['coupon_id'], name: 'index_order_discounts_on_coupon_id'
    t.index ['discount_id'], name: 'index_order_discounts_on_discount_id'
    t.index ['order_id'], name: 'index_order_discounts_on_order_id'
  end

  create_table 'order_items', force: :cascade do |t|
    t.bigint 'order_id', null: false
    t.bigint 'product_id', null: false
    t.integer 'quantity', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['order_id'], name: 'index_order_items_on_order_id'
    t.index ['product_id'], name: 'index_order_items_on_product_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.bigint 'customer_id', null: false
    t.datetime 'date'
    t.decimal 'total_price'
    t.string 'order_type'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['customer_id'], name: 'index_orders_on_customer_id'
  end

  create_table 'product_discounts', force: :cascade do |t|
    t.bigint 'product_id', null: false
    t.bigint 'discount_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['discount_id'], name: 'index_product_discounts_on_discount_id'
    t.index ['product_id'], name: 'index_product_discounts_on_product_id'
  end

  create_table 'product_images', force: :cascade do |t|
    t.bigint 'product_id', null: false
    t.string 'image_url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['product_id'], name: 'index_product_images_on_product_id'
  end

  create_table 'product_stocks', force: :cascade do |t|
    t.bigint 'stock_location_id', null: false
    t.integer 'quantity', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['stock_location_id'], name: 'index_product_stocks_on_stock_location_id'
  end

  create_table 'product_variations', force: :cascade do |t|
    t.bigint 'product_id', null: false
    t.string 'name', limit: 100, null: false
    t.string 'value'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['product_id'], name: 'index_product_variations_on_product_id'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'name', limit: 100, null: false
    t.text 'description', null: false
    t.decimal 'price', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'stock_locations', force: :cascade do |t|
    t.string 'name', limit: 100, null: false
    t.text 'address', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'vouchers', force: :cascade do |t|
    t.string 'code'
    t.decimal 'value'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'coupons', 'discounts'
  add_foreign_key 'customer_addresses', 'customers'
  add_foreign_key 'order_discounts', 'coupons'
  add_foreign_key 'order_discounts', 'discounts'
  add_foreign_key 'order_discounts', 'orders'
  add_foreign_key 'order_items', 'orders'
  add_foreign_key 'order_items', 'products'
  add_foreign_key 'orders', 'customers'
  add_foreign_key 'product_discounts', 'discounts'
  add_foreign_key 'product_discounts', 'products'
  add_foreign_key 'product_images', 'products'
  add_foreign_key 'product_stocks', 'stock_locations'
  add_foreign_key 'product_variations', 'products'
end
