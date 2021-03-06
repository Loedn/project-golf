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

ActiveRecord::Schema.define(version: 20170907145124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["event_id"], name: "index_comments_on_event_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.string   "description"
    t.string   "name"
    t.string   "image"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "email"
    t.string   "phone"
    t.datetime "timeslots",     default: [],              array: true
    t.string   "badges",        default: [],              array: true
    t.integer  "owner_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "disabled_days", default: [],              array: true
    t.integer  "price_cents",   default: 0,  null: false
    t.string   "size"
    t.boolean  "water"
    t.boolean  "sand"
    t.boolean  "trees"
    t.boolean  "plain"
    t.index ["owner_id"], name: "index_courses_on_owner_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.datetime "timeslot"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "title"
    t.integer  "balance_cents", default: 0, null: false
    t.index ["course_id"], name: "index_events_on_course_id", using: :btree
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "friend_requests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "status",     default: "pending"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["friend_id"], name: "index_friend_requests_on_friend_id", using: :btree
    t.index ["user_id"], name: "index_friend_requests_on_user_id", using: :btree
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id", using: :btree
    t.index ["user_id"], name: "index_friendships_on_user_id", using: :btree
  end

  create_table "hole_scores", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "hole_id"
    t.integer  "event_id"
    t.integer  "strikes",    default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["event_id"], name: "index_hole_scores_on_event_id", using: :btree
    t.index ["hole_id"], name: "index_hole_scores_on_hole_id", using: :btree
    t.index ["user_id"], name: "index_hole_scores_on_user_id", using: :btree
  end

  create_table "holes", force: :cascade do |t|
    t.string   "name"
    t.integer  "par"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_holes_on_course_id", using: :btree
  end

  create_table "invites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "status"
    t.index ["event_id"], name: "index_invites_on_event_id", using: :btree
    t.index ["user_id"], name: "index_invites_on_user_id", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "friend_request_id"
    t.boolean  "read",              default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["event_id"], name: "index_notifications_on_event_id", using: :btree
    t.index ["friend_request_id"], name: "index_notifications_on_friend_request_id", using: :btree
    t.index ["user_id"], name: "index_notifications_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "status"
    t.string   "sku"
    t.integer  "amount_cents", default: 0, null: false
    t.json     "payment"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "event_id"
    t.index ["event_id"], name: "index_orders_on_event_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "content"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "rating"
    t.integer  "user_id"
    t.index ["course_id"], name: "index_reviews_on_course_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "photo"
    t.string   "location"
    t.string   "authentication_token",   limit: 30
    t.string   "description"
    t.string   "favourite_course"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "comments", "events"
  add_foreign_key "courses", "users", column: "owner_id"
  add_foreign_key "events", "courses"
  add_foreign_key "events", "users"
  add_foreign_key "friend_requests", "users"
  add_foreign_key "friend_requests", "users", column: "friend_id"
  add_foreign_key "friendships", "users"
  add_foreign_key "friendships", "users", column: "friend_id"
  add_foreign_key "hole_scores", "events"
  add_foreign_key "hole_scores", "holes"
  add_foreign_key "hole_scores", "users"
  add_foreign_key "holes", "courses"
  add_foreign_key "invites", "events"
  add_foreign_key "invites", "users"
  add_foreign_key "notifications", "events"
  add_foreign_key "notifications", "users"
  add_foreign_key "orders", "events"
  add_foreign_key "reviews", "courses"
end
