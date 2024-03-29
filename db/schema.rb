# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140226155506) do

  create_table "catalogitems", :force => true do |t|
    t.string   "line"
    t.string   "description"
    t.string   "img"
    t.integer  "catalog_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "catalogs", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "img"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.boolean  "state",      :default => true
    t.integer  "position",   :default => 0
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "config_apps", :force => true do |t|
    t.string   "city"
    t.string   "currency"
    t.decimal  "rate",       :precision => 6, :scale => 2, :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "forums", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "state",        :default => true
    t.integer  "topics_count", :default => 0
    t.integer  "posts_count",  :default => 0
    t.integer  "position",     :default => 0
    t.integer  "category_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "items", :force => true do |t|
    t.decimal  "value",       :precision => 6, :scale => 2,                    :null => false
    t.string   "link",                                                         :null => false
    t.string   "name",                                                         :null => false
    t.string   "seller_rate",                                                  :null => false
    t.string   "img",                                                          :null => false
    t.string   "color"
    t.string   "size"
    t.integer  "order_id",                                                     :null => false
    t.string   "comment"
    t.integer  "status",                                    :default => 0,     :null => false
    t.integer  "count",                                     :default => 1,     :null => false
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
    t.boolean  "havy",                                      :default => false
    t.string   "order_no"
    t.string   "track"
    t.decimal  "value_total", :precision => 6, :scale => 2, :default => 0.0
  end

  add_index "items", ["order_id", "created_at", "id"], :name => "index_items_on_order_id_and_created_at_and_id"

  create_table "lotitems", :force => true do |t|
    t.decimal  "value_total", :precision => 6, :scale => 2, :default => 0.0, :null => false
    t.string   "item"
    t.integer  "user_id",                                   :default => 0
    t.integer  "lot_id"
    t.integer  "status",                                    :default => 0,   :null => false
    t.string   "color"
    t.string   "comment"
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
  end

  create_table "lots", :force => true do |t|
    t.decimal  "value",       :precision => 6, :scale => 2,                    :null => false
    t.string   "link",                                                         :null => false
    t.string   "name",                                                         :null => false
    t.string   "seller_rate",                               :default => "0",   :null => false
    t.string   "img",                                                          :null => false
    t.string   "color"
    t.integer  "catalog_id"
    t.integer  "topic_id"
    t.integer  "moderator"
    t.integer  "processing"
    t.text     "annotation"
    t.integer  "status",                                    :default => 0,     :null => false
    t.string   "orderno"
    t.string   "track"
    t.boolean  "havy",                                      :default => false
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
  end

  add_index "lots", ["created_at", "id", "orderno", "name"], :name => "index_lots_on_created_at_and_id_and_orderno_and_name"

  create_table "lotts", :force => true do |t|
    t.decimal  "value",      :precision => 6, :scale => 2,                :null => false
    t.string   "name",                                                    :null => false
    t.string   "lot_number",                                              :null => false
    t.string   "color"
    t.string   "size"
    t.integer  "lot_id",                                   :default => 0, :null => false
    t.integer  "user_id",                                  :default => 0, :null => false
    t.string   "comment"
    t.integer  "status",                                   :default => 0, :null => false
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "status",                                    :default => 0,   :null => false
    t.integer  "user_id",                                                    :null => false
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
    t.decimal  "order_value", :precision => 6, :scale => 2, :default => 0.0
  end

  add_index "orders", ["user_id", "created_at", "id"], :name => "index_orders_on_user_id_and_created_at_and_id"

  create_table "payments", :force => true do |t|
    t.date     "data",                                                    :null => false
    t.time     "time",                                                    :null => false
    t.decimal  "value",      :precision => 6, :scale => 2,                :null => false
    t.integer  "user_id",                                                 :null => false
    t.string   "comment"
    t.integer  "status",                                   :default => 0, :null => false
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
  end

  add_index "payments", ["user_id", "created_at"], :name => "index_payments_on_user_id_and_created_at"

  create_table "posts", :force => true do |t|
    t.text     "body"
    t.integer  "forum_id"
    t.integer  "topic_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.decimal  "price",       :precision => 8, :scale => 2
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "topics", :force => true do |t|
    t.string   "title"
    t.integer  "hits",        :default => 0
    t.boolean  "sticky",      :default => false
    t.boolean  "locked",      :default => false
    t.integer  "posts_count"
    t.integer  "forum_id"
    t.integer  "user_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                                :default => "",  :null => false
    t.string   "encrypted_password",                                   :default => "",  :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                            :null => false
    t.datetime "updated_at",                                                            :null => false
    t.string   "nik"
    t.decimal  "balance",                :precision => 6, :scale => 2, :default => 0.0, :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "roles_mask"
    t.integer  "configApp_id"
    t.integer  "topics_count",                                         :default => 0
    t.integer  "posts_count",                                          :default => 0
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
