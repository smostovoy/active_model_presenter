ActiveRecord::Schema.define(version: 1) do
  create_table "posts", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end