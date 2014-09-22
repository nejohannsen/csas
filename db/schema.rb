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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140919223500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: true do |t|
    t.string   "title"
    t.integer  "resource_id"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campaigns", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "link"
    t.integer  "image_id"
    t.text     "intro"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "character_templates", force: true do |t|
    t.string   "player"
    t.string   "name"
    t.text     "bio"
    t.text     "gm_bio"
    t.string   "status"
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "caste"
    t.integer  "user_id"
  end

  create_table "games", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "link"
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "journal_entries", force: true do |t|
    t.text     "content"
    t.string   "date"
    t.integer  "player_character_id"
    t.boolean  "private",             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_characters", force: true do |t|
    t.integer  "campaign_id"
    t.integer  "character_template_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.integer  "campaign_id"
    t.integer  "user_id"
    t.string   "aasm_state"
    t.integer  "status_approver_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.text     "bio"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.string   "display_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
