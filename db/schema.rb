# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_20_184552) do

  create_table "chat_rooms", force: :cascade do |t|
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "chat_room_id", null: false
    t.index ["chat_room_id"], name: "index_conversations_on_chat_room_id"
    t.index ["user_id"], name: "index_conversations_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "body"
    t.integer "user_id", null: false
    t.integer "chat_room_id", null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "conversations", "chat_rooms"
  add_foreign_key "conversations", "users"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
end
