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

ActiveRecord::Schema[7.0].define(version: 2023_04_28_022047) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "brands", force: :cascade do |t|
    t.string "name", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_brands_on_deleted_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_categories_on_deleted_at"
  end

  create_table "companies", force: :cascade do |t|
    t.text "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_companies_on_deleted_at"
  end

  create_table "device_histories", force: :cascade do |t|
    t.datetime "input_date"
    t.datetime "output_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "device_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_device_histories_on_deleted_at"
    t.index ["device_id"], name: "index_device_histories_on_device_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.text "description"
    t.float "price", default: 0.0, null: false
    t.text "source", null: false
    t.integer "status", default: 0, null: false
    t.text "images"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "brand_id"
    t.bigint "device_id"
    t.bigint "office_id"
    t.bigint "category_id"
    t.datetime "deleted_at"
    t.bigint "import_history_id"
    t.date "input_date"
    t.index ["brand_id"], name: "index_devices_on_brand_id"
    t.index ["category_id"], name: "index_devices_on_category_id"
    t.index ["deleted_at"], name: "index_devices_on_deleted_at"
    t.index ["device_id"], name: "index_devices_on_device_id"
    t.index ["office_id"], name: "index_devices_on_office_id"
  end

  create_table "group_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "group_id"
    t.bigint "user_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_group_users_on_deleted_at"
    t.index ["group_id"], name: "index_group_users_on_group_id"
    t.index ["user_id"], name: "index_group_users_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.string "project_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_groups_on_deleted_at"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "import_histories", force: :cascade do |t|
    t.string "file_name"
    t.datetime "input_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_id"
    t.datetime "deleted_at"
    t.index ["author_id"], name: "index_import_histories_on_author_id"
    t.index ["deleted_at"], name: "index_import_histories_on_deleted_at"
  end

  create_table "office_infos", force: :cascade do |t|
    t.string "name", null: false
    t.text "information"
    t.text "address"
    t.text "email"
    t.string "phone_number"
    t.bigint "info_id", null: false
    t.string "info_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_office_infos_on_deleted_at"
  end

  create_table "offices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.datetime "deleted_at"
    t.index ["company_id"], name: "index_offices_on_company_id"
    t.index ["deleted_at"], name: "index_offices_on_deleted_at"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "type_request", default: 0, null: false
    t.integer "status"
    t.text "reason"
    t.text "information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "device_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_requests_on_deleted_at"
    t.index ["device_id"], name: "index_requests_on_device_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "user_confirm_devices", force: :cascade do |t|
    t.integer "admin_device_status"
    t.integer "staff_device_status"
    t.datetime "admin_confirm_at"
    t.datetime "staff_comfirm_at"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_device_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_user_confirm_devices_on_deleted_at"
    t.index ["user_device_id"], name: "index_user_confirm_devices_on_user_device_id"
  end

  create_table "user_devices", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.datetime "input_date"
    t.datetime "output_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "device_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_user_devices_on_deleted_at"
    t.index ["device_id"], name: "index_user_devices_on_device_id"
    t.index ["user_id"], name: "index_user_devices_on_user_id"
  end

  create_table "user_subscriptions", force: :cascade do |t|
    t.bigint "user_id"
    t.string "endpoint"
    t.json "keys"
    t.datetime "expiration_time"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "uid"
    t.string "provider"
    t.string "avatar"
    t.string "first_name"
    t.string "last_name"
    t.integer "status", default: 0, null: false
    t.integer "role", default: 0, null: false
    t.bigint "office_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "device_histories", "devices"
  add_foreign_key "devices", "brands"
  add_foreign_key "devices", "categories"
  add_foreign_key "devices", "devices"
  add_foreign_key "devices", "offices"
  add_foreign_key "group_users", "groups"
  add_foreign_key "group_users", "users"
  add_foreign_key "groups", "users"
  add_foreign_key "import_histories", "users", column: "author_id"
  add_foreign_key "offices", "companies"
  add_foreign_key "requests", "devices"
  add_foreign_key "requests", "users"
  add_foreign_key "user_confirm_devices", "user_devices"
  add_foreign_key "user_devices", "devices"
  add_foreign_key "user_devices", "users"
  add_foreign_key "user_subscriptions", "users"
end
