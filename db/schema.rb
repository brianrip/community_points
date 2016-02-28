ActiveRecord::Schema.define(version: 20160228005315) do

  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "title"
    t.integer  "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rewards", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "point_cost"
    t.boolean  "redeemed",    default: false
    t.string   "picture",     default: "http://www.saidthegramophone.com/images/capybara.jpg"
    t.datetime "created_at",                                                                   null: false
    t.datetime "updated_at",                                                                   null: false
  end

  create_table "user_activities", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_activities", ["activity_id"], name: "index_user_activities_on_activity_id", using: :btree
  add_index "user_activities", ["user_id"], name: "index_user_activities_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.integer  "role",            default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "user_activities", "activities"
  add_foreign_key "user_activities", "users"
end
