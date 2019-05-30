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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2011_10_14_160714) do

  create_table "oauth2_access_tokens", force: :cascade do |t|
    t.integer "user_id"
    t.integer "client_id"
    t.integer "refresh_token_id"
    t.string "token"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id"], name: "index_oauth2_access_tokens_on_client_id"
    t.index ["expires_at"], name: "index_oauth2_access_tokens_on_expires_at"
    t.index ["token"], name: "index_oauth2_access_tokens_on_token", unique: true
    t.index ["user_id"], name: "index_oauth2_access_tokens_on_user_id"
  end

  create_table "oauth2_authorization_codes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "client_id"
    t.string "token"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id"], name: "index_oauth2_authorization_codes_on_client_id"
    t.index ["expires_at"], name: "index_oauth2_authorization_codes_on_expires_at"
    t.index ["token"], name: "index_oauth2_authorization_codes_on_token", unique: true
    t.index ["user_id"], name: "index_oauth2_authorization_codes_on_user_id"
  end

  create_table "oauth2_clients", force: :cascade do |t|
    t.string "name"
    t.string "redirect_uri"
    t.string "website"
    t.string "identifier"
    t.string "secret"
    t.string "scopes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["identifier"], name: "index_oauth2_clients_on_identifier", unique: true
  end

  create_table "oauth2_refresh_tokens", force: :cascade do |t|
    t.integer "user_id"
    t.integer "client_id"
    t.string "token"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id"], name: "index_oauth2_refresh_tokens_on_client_id"
    t.index ["expires_at"], name: "index_oauth2_refresh_tokens_on_expires_at"
    t.index ["token"], name: "index_oauth2_refresh_tokens_on_token", unique: true
    t.index ["user_id"], name: "index_oauth2_refresh_tokens_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
