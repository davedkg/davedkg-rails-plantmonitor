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

ActiveRecord::Schema.define(version: 2022_04_13_012510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "deleted_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deleted_at", "record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.datetime "deleted_at", precision: 6
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["deleted_at", "record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.datetime "deleted_at", precision: 6
    t.string "service_name", null: false
    t.index ["deleted_at", "key"], name: "index_active_storage_blobs_on_deleted_at_and_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "plant_readings", force: :cascade do |t|
    t.bigint "plant_id", null: false
    t.decimal "soil_moisture"
    t.decimal "humidity"
    t.decimal "temperature"
    t.datetime "deleted_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "raining", default: false
    t.decimal "light_intensity", default: "0.0"
    t.index ["deleted_at", "plant_id", "created_at"], name: "index_plant_readings_on_deleted_at_and_plant_id_and_created_at"
  end

  create_table "plants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.string "api_key", null: false
    t.datetime "last_seen_at", precision: 6
    t.datetime "deleted_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deleted_at"], name: "index_plants_on_deleted_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.string "name"
    t.string "role", default: "user", null: false
    t.string "time_zone", default: "Eastern Time (US & Canada)", null: false
    t.datetime "deleted_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "state", default: "enabled", null: false
    t.index ["deleted_at", "confirmation_token"], name: "index_users_on_deleted_at_and_confirmation_token", unique: true
    t.index ["deleted_at", "email"], name: "index_users_on_deleted_at_and_email", unique: true
    t.index ["deleted_at", "invitation_token"], name: "index_users_on_deleted_at_and_invitation_token", unique: true
    t.index ["deleted_at", "invitations_count"], name: "index_users_on_deleted_at_and_invitations_count"
    t.index ["deleted_at", "invited_by_id"], name: "index_users_on_deleted_at_and_invited_by_id"
    t.index ["deleted_at", "name"], name: "index_users_on_deleted_at_and_name", unique: true
    t.index ["deleted_at", "reset_password_token"], name: "index_users_on_deleted_at_and_reset_password_token", unique: true
    t.index ["deleted_at", "unlock_token"], name: "index_users_on_deleted_at_and_unlock_token", unique: true
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
