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

ActiveRecord::Schema.define(version: 20170419040706) do

  create_table "ad_images", force: :cascade do |t|
    t.string   "file",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "ad_msgs", force: :cascade do |t|
    t.string   "to_user",    limit: 255
    t.string   "from_user",  limit: 255
    t.text     "msg",        limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "article_content_contentfactory_ships", force: :cascade do |t|
    t.string   "title",                          limit: 255
    t.text     "content",                        limit: 16777215
    t.integer  "sort",                           limit: 4,        default: 0
    t.boolean  "enabled",                                         default: true
    t.string   "cf_article_id",                  limit: 255
    t.string   "forum_id",                       limit: 255
    t.string   "article_contentfactory_ship_id", limit: 255
    t.integer  "article_content_id",             limit: 4
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
  end

  add_index "article_content_contentfactory_ships", ["article_content_id"], name: "cf_article_content_article_content_id", using: :btree
  add_index "article_content_contentfactory_ships", ["article_contentfactory_ship_id"], name: "cf_article_content_cf_article_ship_id", using: :btree
  add_index "article_content_contentfactory_ships", ["cf_article_id"], name: "cf_article_content_cf_article_id", using: :btree
  add_index "article_content_contentfactory_ships", ["enabled"], name: "cf_article_content_enabled", using: :btree
  add_index "article_content_contentfactory_ships", ["forum_id"], name: "cf_article_content_cf_forum_id", using: :btree
  add_index "article_content_contentfactory_ships", ["sort"], name: "cf_article_content_sort", using: :btree

  create_table "article_contentfactory_ships", force: :cascade do |t|
    t.string   "tag_id",         limit: 255, default: "-1"
    t.boolean  "is_locked",                  default: false
    t.boolean  "is_in_gem",                  default: false
    t.boolean  "is_top",                     default: false
    t.string   "title",          limit: 255
    t.integer  "author_user_id", limit: 4
    t.integer  "status",         limit: 4,   default: 1
    t.integer  "content_count",  limit: 4,   default: 1
    t.string   "cf_article_id",  limit: 255
    t.string   "forum_id",       limit: 255
    t.integer  "article_id",     limit: 4
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "article_contentfactory_ships", ["article_id"], name: "cf_article_ship_article_id", using: :btree
  add_index "article_contentfactory_ships", ["author_user_id"], name: "cf_article_ship_author_user_id", using: :btree
  add_index "article_contentfactory_ships", ["content_count"], name: "cf_article_ship_content_count", using: :btree
  add_index "article_contentfactory_ships", ["forum_id"], name: "cf_article_ship_forum_id", using: :btree
  add_index "article_contentfactory_ships", ["is_in_gem"], name: "cf_article_ship_is_in_gem", using: :btree
  add_index "article_contentfactory_ships", ["is_locked"], name: "cf_article_ship_is_locked", using: :btree
  add_index "article_contentfactory_ships", ["is_top"], name: "cf_article_ship_is_top", using: :btree
  add_index "article_contentfactory_ships", ["status"], name: "cf_article_ship_status", using: :btree

  create_table "article_contents", force: :cascade do |t|
    t.integer  "article_id", limit: 4,                         null: false
    t.integer  "user_id",    limit: 4,          default: 3,    null: false
    t.string   "title",      limit: 255,        default: ""
    t.text     "content",    limit: 4294967295
    t.integer  "sort",       limit: 4,          default: 0,    null: false
    t.boolean  "enabled",                       default: true, null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "article_contents", ["article_id"], name: "index_article_contents_on_article_id", using: :btree
  add_index "article_contents", ["enabled"], name: "index_article_contents_on_enabled", using: :btree
  add_index "article_contents", ["sort"], name: "index_article_contents_on_sort", using: :btree
  add_index "article_contents", ["user_id"], name: "index_article_contents_on_user_id", using: :btree

  create_table "article_del_reasons", force: :cascade do |t|
    t.string   "name",       limit: 255, default: ""
    t.integer  "sort",       limit: 4,   default: 0,    null: false
    t.boolean  "enabled",                default: true, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "article_del_reasons", ["enabled"], name: "index_article_del_reasons_on_enabled", using: :btree
  add_index "article_del_reasons", ["sort"], name: "index_article_del_reasons_on_sort", using: :btree

  create_table "article_domain_tops", force: :cascade do |t|
    t.integer  "domain_id",  limit: 4,             null: false
    t.integer  "article_id", limit: 4,             null: false
    t.boolean  "enabled",                          null: false
    t.integer  "user_id",    limit: 4, default: 3, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "article_domain_tops", ["article_id"], name: "index_article_domain_tops_on_article_id", using: :btree
  add_index "article_domain_tops", ["domain_id"], name: "index_article_domain_tops_on_domain_id", using: :btree
  add_index "article_domain_tops", ["enabled"], name: "index_article_domain_tops_on_enabled", using: :btree
  add_index "article_domain_tops", ["user_id"], name: "index_article_domain_tops_on_user_id", using: :btree

  create_table "article_image_contentfactory_ships", force: :cascade do |t|
    t.integer  "categorized",                        limit: 4,     default: 1
    t.text     "url_origin",                         limit: 65535
    t.text     "url_big",                            limit: 65535
    t.text     "url_medium",                         limit: 65535
    t.text     "url_small",                          limit: 65535
    t.string   "gem_article_contentfactory_ship_id", limit: 255
    t.integer  "article_image_id",                   limit: 4
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
  end

  add_index "article_image_contentfactory_ships", ["article_image_id"], name: "cf_article_image_article_image_id", using: :btree
  add_index "article_image_contentfactory_ships", ["categorized"], name: "cf_article_image_cf_categorized", using: :btree
  add_index "article_image_contentfactory_ships", ["gem_article_contentfactory_ship_id"], name: "cf_article_image_cf_gem_article_id", using: :btree

  create_table "article_images", force: :cascade do |t|
    t.integer  "categorized",     limit: 4,     default: 1
    t.string   "imageable_type",  limit: 255
    t.integer  "imageable_id",    limit: 4
    t.string   "file",            limit: 255
    t.string   "type_text",       limit: 255
    t.text     "url_origin",      limit: 65535
    t.text     "url_extra_large", limit: 65535
    t.text     "url_big",         limit: 65535
    t.text     "url_medium",      limit: 65535
    t.text     "url_small",       limit: 65535
    t.text     "url_thumb",       limit: 65535
    t.integer  "user_id",         limit: 4
    t.boolean  "watermark",                     default: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "article_images", ["categorized"], name: "index_article_images_on_categorized", using: :btree
  add_index "article_images", ["imageable_id"], name: "index_article_images_on_imageable_id", using: :btree
  add_index "article_images", ["imageable_type"], name: "index_article_images_on_imageable_type", using: :btree
  add_index "article_images", ["type_text"], name: "index_article_images_on_type_text", using: :btree
  add_index "article_images", ["user_id"], name: "index_article_images_on_user_id", using: :btree

  create_table "article_replies", force: :cascade do |t|
    t.integer  "article_id",            limit: 4
    t.integer  "user_id",               limit: 4
    t.text     "content",               limit: 16777215
    t.integer  "parent_id",             limit: 4
    t.boolean  "enabled"
    t.integer  "article_del_reason_id", limit: 4
    t.text     "delete_reason",         limit: 65535
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "article_replies", ["article_id", "parent_id", "enabled"], name: "index_article_replies_on_article_id_and_parent_id_and_enabled", using: :btree
  add_index "article_replies", ["user_id"], name: "index_article_replies_on_user_id", using: :btree

  create_table "article_resource_ships", force: :cascade do |t|
    t.integer  "article_id",    limit: 4
    t.string   "resource_type", limit: 255, null: false
    t.integer  "resource_id",   limit: 4,   null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "articles", force: :cascade do |t|
    t.integer  "forum_id",              limit: 4,                     null: false
    t.boolean  "is_locked",                           default: false
    t.boolean  "is_in_gem",                           default: false
    t.boolean  "is_top",                              default: false
    t.string   "title",                 limit: 255,   default: ""
    t.string   "url_keyword",           limit: 255
    t.integer  "author_user_id",        limit: 4,     default: 3,     null: false
    t.integer  "replier_user_id",       limit: 4,     default: 3,     null: false
    t.integer  "article_replies_count", limit: 4,     default: 0
    t.datetime "last_reply"
    t.integer  "status",                limit: 4,     default: 1,     null: false
    t.integer  "pageview",              limit: 4,     default: 0,     null: false
    t.integer  "article_del_reason_id", limit: 4
    t.text     "delete_reason",         limit: 65535
    t.integer  "content_count",         limit: 4,     default: 1
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "articles", ["author_user_id"], name: "index_articles_on_author_user_id", using: :btree
  add_index "articles", ["created_at", "status"], name: "index_articles_on_created_at_and_status", using: :btree
  add_index "articles", ["forum_id", "status", "is_top", "last_reply"], name: "article_list", using: :btree
  add_index "articles", ["forum_id"], name: "index_articles_on_forum_id", using: :btree

  create_table "authorizations", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "provider",   limit: 255
    t.string   "uid",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "authorizations", ["user_id"], name: "index_authorizations_on_user_id", using: :btree

  create_table "basic_role_mappers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "posts",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "bonus_gift_ships", force: :cascade do |t|
    t.integer  "bonus_id",        limit: 4
    t.integer  "user_gift_id",    limit: 4
    t.integer  "quantity",        limit: 4
    t.integer  "remain_quantity", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "bonus_gift_ships", ["bonus_id"], name: "index_bonus_gift_ships_on_bonus_id", using: :btree
  add_index "bonus_gift_ships", ["user_gift_id"], name: "index_bonus_gift_ships_on_user_gift_id", using: :btree

  create_table "bonus_records", force: :cascade do |t|
    t.integer  "bonus_id",     limit: 4
    t.integer  "bonus_points", limit: 4
    t.integer  "user_id",      limit: 4
    t.integer  "user_gift_id", limit: 4
    t.integer  "quantity",     limit: 4
    t.string   "exchange_ip",  limit: 255
    t.boolean  "is_sended"
    t.integer  "bonus_type",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "bonus_records", ["bonus_id"], name: "index_bonus_records_on_bonus_id", using: :btree
  add_index "bonus_records", ["user_id"], name: "index_bonus_records_on_user_id", using: :btree

  create_table "bonuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "intro",      limit: 65535
    t.integer  "domain_id",  limit: 4
    t.datetime "date_from"
    t.datetime "date_to"
    t.boolean  "enabled"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "brand_hall_ships", force: :cascade do |t|
    t.integer  "brand_id",   limit: 4
    t.integer  "hall_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "brand_hall_ships", ["brand_id"], name: "index_brand_hall_ships_on_brand_id", using: :btree
  add_index "brand_hall_ships", ["hall_id"], name: "index_brand_hall_ships_on_hall_id", using: :btree

  create_table "brand_images", force: :cascade do |t|
    t.integer  "categorized",    limit: 4,     default: 1
    t.string   "imageable_type", limit: 255
    t.integer  "imageable_id",   limit: 4
    t.string   "file",           limit: 255
    t.string   "type_text",      limit: 255
    t.text     "url_origin",     limit: 65535
    t.text     "url_big",        limit: 65535
    t.text     "url_medium",     limit: 65535
    t.text     "url_small",      limit: 65535
    t.text     "url_thumb",      limit: 65535
    t.integer  "user_id",        limit: 4
    t.boolean  "watermark",                    default: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "brand_images", ["categorized"], name: "index_brand_images_on_categorized", using: :btree
  add_index "brand_images", ["imageable_id"], name: "index_brand_images_on_imageable_id", using: :btree
  add_index "brand_images", ["imageable_type"], name: "index_brand_images_on_imageable_type", using: :btree
  add_index "brand_images", ["type_text"], name: "index_brand_images_on_type_text", using: :btree
  add_index "brand_images", ["user_id"], name: "index_brand_images_on_user_id", using: :btree

  create_table "brands", force: :cascade do |t|
    t.string   "name_normal",   limit: 255
    t.string   "name_local",    limit: 255
    t.integer  "sort",          limit: 4,     default: 99
    t.text     "intro",         limit: 65535
    t.text     "story",         limit: 65535
    t.text     "keyword",       limit: 65535
    t.boolean  "enabled"
    t.boolean  "is_adv_search"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "brands", ["enabled"], name: "index_brands_on_enabled", using: :btree
  add_index "brands", ["is_adv_search"], name: "index_brands_on_is_adv_search", using: :btree

  create_table "canned_responses", force: :cascade do |t|
    t.string   "title",                limit: 255
    t.text     "content",              limit: 65535
    t.integer  "question_category_id", limit: 4,                    null: false
    t.integer  "domain_id",            limit: 4,                    null: false
    t.boolean  "enabled",                            default: true, null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "canned_responses", ["domain_id"], name: "index_canned_responses_on_domain_id", using: :btree
  add_index "canned_responses", ["enabled"], name: "index_canned_responses_on_enabled", using: :btree
  add_index "canned_responses", ["question_category_id"], name: "index_canned_responses_on_question_category_id", using: :btree

  create_table "chat_requests", primary_key: "chat_id", force: :cascade do |t|
    t.integer  "sender_id",        limit: 4,     null: false
    t.integer  "receiver_id",      limit: 4,     null: false
    t.integer  "item_id",          limit: 4,     null: false
    t.integer  "request_id",       limit: 4,     null: false
    t.text     "message",          limit: 65535, null: false
    t.string   "sender_email",     limit: 200,   null: false
    t.string   "receiver_email",   limit: 200,   null: false
    t.integer  "is_read_sender",   limit: 4,     null: false
    t.integer  "is_read_receiver", limit: 4,     null: false
    t.integer  "status",           limit: 4,     null: false
    t.datetime "created_date",                   null: false
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.integer  "member_a",   limit: 4, null: false
    t.integer  "member_b",   limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "region_id",  limit: 4
    t.integer  "sort",       limit: 4,   default: 0
    t.boolean  "enabled",                default: false, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "cities", ["enabled"], name: "index_cities_on_enabled", using: :btree
  add_index "cities", ["sort"], name: "index_cities_on_sort", using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255,                 null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.boolean  "watermark",                     default: false
    t.boolean  "magnifier"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "csv_uploads", force: :cascade do |t|
    t.string   "file",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "del_chats", force: :cascade do |t|
    t.integer  "member",       limit: 4, null: false
    t.integer  "chat_room_id", limit: 4, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "districts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "zipcode",    limit: 255
    t.integer  "city_id",    limit: 4
    t.integer  "sort",       limit: 4,   default: 0,     null: false
    t.boolean  "enabled",                default: false, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "districts", ["city_id"], name: "index_districts_on_city_id", using: :btree
  add_index "districts", ["enabled"], name: "index_districts_on_enabled", using: :btree
  add_index "districts", ["sort"], name: "index_districts_on_sort", using: :btree

  create_table "domain_user_ships", force: :cascade do |t|
    t.integer  "domain_id",  limit: 4, null: false
    t.integer  "user_id",    limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "domains", force: :cascade do |t|
    t.string   "name_local",         limit: 255,   default: ""
    t.string   "name_en",            limit: 255
    t.string   "color_style",        limit: 255
    t.string   "file",               limit: 255
    t.string   "default_image_file", limit: 255
    t.string   "default_user_image", limit: 255
    t.integer  "sort",               limit: 4,     default: 99,   null: false
    t.string   "keyword",            limit: 255
    t.text     "seo_desc",           limit: 65535
    t.text     "footer_contact",     limit: 65535
    t.text     "footer_copyright",   limit: 65535
    t.boolean  "enabled",                          default: true, null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "domains", ["enabled"], name: "index_domains_on_enabled", using: :btree
  add_index "domains", ["sort"], name: "index_domains_on_sort", using: :btree

  create_table "favourite_product", primary_key: "favourite_product_id", force: :cascade do |t|
    t.integer  "user_id",      limit: 4, null: false
    t.integer  "product_id",   limit: 4, null: false
    t.datetime "created_date",           null: false
  end

  create_table "favourite_shop", primary_key: "favourite_product_id", force: :cascade do |t|
    t.integer  "user_id",      limit: 4, null: false
    t.integer  "shop_id",      limit: 4, null: false
    t.datetime "created_date",           null: false
  end

  create_table "fet_brand_urls", force: :cascade do |t|
    t.integer  "brand_id",   limit: 4,                  null: false
    t.string   "pc_url",     limit: 500
    t.string   "mobi_url",   limit: 500
    t.boolean  "status",                 default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "fet_brand_urls", ["brand_id"], name: "index_fet_brand_urls_on_brand_id", using: :btree

  create_table "fet_link_wordings", force: :cascade do |t|
    t.string   "product_wording", limit: 255
    t.string   "review_wording",  limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "fet_product_urls", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.integer  "guid",             limit: 4,                  null: false
    t.string   "product_pc_url",   limit: 500
    t.string   "product_mobi_url", limit: 500
    t.string   "review_pc_url",    limit: 500
    t.string   "review_mobi_url",  limit: 500
    t.boolean  "status",                       default: true
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "fet_product_urls", ["guid"], name: "index_fet_product_urls_on_guid", using: :btree
  add_index "fet_product_urls", ["name"], name: "index_fet_product_urls_on_name", using: :btree

  create_table "footers", force: :cascade do |t|
    t.text     "name",          limit: 65535
    t.string   "url_code",      limit: 255
    t.text     "content",       limit: 65535
    t.string   "permalink",     limit: 255
    t.boolean  "is_new_window",               default: false
    t.integer  "content_type",  limit: 4
    t.integer  "sort",          limit: 4,     default: 0
    t.integer  "parent_id",     limit: 4
    t.integer  "domain_id",     limit: 4
    t.boolean  "enabled"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "footers", ["content_type"], name: "index_footers_on_content_type", using: :btree
  add_index "footers", ["domain_id"], name: "index_footers_on_domain_id", using: :btree
  add_index "footers", ["enabled"], name: "index_footers_on_enabled", using: :btree
  add_index "footers", ["parent_id"], name: "index_footers_on_parent_id", using: :btree
  add_index "footers", ["sort"], name: "index_footers_on_sort", using: :btree

  create_table "forum_article_cats", force: :cascade do |t|
    t.string   "name",       limit: 255, default: ""
    t.integer  "forum_id",   limit: 4,                  null: false
    t.integer  "sort",       limit: 4,   default: 0,    null: false
    t.boolean  "enabled",                default: true, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "forum_article_cats", ["enabled"], name: "index_forum_article_cats_on_enabled", using: :btree
  add_index "forum_article_cats", ["forum_id"], name: "index_forum_article_cats_on_forum_id", using: :btree
  add_index "forum_article_cats", ["sort"], name: "index_forum_article_cats_on_sort", using: :btree

  create_table "forum_article_ships", force: :cascade do |t|
    t.integer  "forum_id",             limit: 4,                 null: false
    t.integer  "article_id",           limit: 4,                 null: false
    t.integer  "forum_article_cat_id", limit: 4,                 null: false
    t.boolean  "is_top",                         default: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "forum_article_ships", ["article_id"], name: "index_forum_article_ships_on_article_id", using: :btree
  add_index "forum_article_ships", ["forum_article_cat_id"], name: "index_forum_article_ships_on_forum_article_cat_id", using: :btree
  add_index "forum_article_ships", ["forum_id"], name: "index_forum_article_ships_on_forum_id", using: :btree
  add_index "forum_article_ships", ["is_top"], name: "index_forum_article_ships_on_is_top", using: :btree

  create_table "forum_group_ships", force: :cascade do |t|
    t.integer  "forum_id",       limit: 4
    t.integer  "forum_group_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "forum_group_ships", ["forum_group_id"], name: "index_forum_group_ships_on_forum_group_id", using: :btree
  add_index "forum_group_ships", ["forum_id"], name: "index_forum_group_ships_on_forum_id", using: :btree

  create_table "forum_groups", force: :cascade do |t|
    t.integer  "domain_id",  limit: 4,                  null: false
    t.string   "name",       limit: 255,   default: ""
    t.text     "announce",   limit: 65535
    t.integer  "sort",       limit: 4,     default: 0,  null: false
    t.boolean  "enabled",                               null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "forum_groups", ["domain_id"], name: "index_forum_groups_on_domain_id", using: :btree
  add_index "forum_groups", ["enabled"], name: "index_forum_groups_on_enabled", using: :btree
  add_index "forum_groups", ["sort"], name: "index_forum_groups_on_sort", using: :btree

  create_table "forum_images", force: :cascade do |t|
    t.integer  "categorized",     limit: 4,     default: 1
    t.string   "imageable_type",  limit: 255
    t.integer  "imageable_id",    limit: 4
    t.string   "file",            limit: 255
    t.string   "type_text",       limit: 255
    t.text     "url_origin",      limit: 65535
    t.text     "url_extra_large", limit: 65535
    t.text     "url_big",         limit: 65535
    t.text     "url_medium",      limit: 65535
    t.text     "url_small",       limit: 65535
    t.text     "url_thumb",       limit: 65535
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.boolean  "watermark",                     default: false
    t.integer  "user_id",         limit: 4
  end

  add_index "forum_images", ["categorized"], name: "index_forum_images_on_categorized", using: :btree
  add_index "forum_images", ["imageable_id"], name: "index_forum_images_on_imageable_id", using: :btree
  add_index "forum_images", ["imageable_type"], name: "index_forum_images_on_imageable_type", using: :btree
  add_index "forum_images", ["type_text"], name: "index_forum_images_on_type_text", using: :btree
  add_index "forum_images", ["user_id"], name: "index_forum_images_on_user_id", using: :btree

  create_table "forum_managers", force: :cascade do |t|
    t.integer  "forum_id",   limit: 4, null: false
    t.integer  "user_id",    limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "forum_managers", ["forum_id"], name: "index_forum_managers_on_forum_id", using: :btree
  add_index "forum_managers", ["user_id"], name: "index_forum_managers_on_user_id", using: :btree

  create_table "forum_relation_products", force: :cascade do |t|
    t.integer  "sort",       limit: 4
    t.integer  "forum_id",   limit: 4, null: false
    t.integer  "product_id", limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "forum_resource_ships", force: :cascade do |t|
    t.integer  "forum_id",      limit: 4
    t.string   "resource_type", limit: 30
    t.integer  "resource_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "forum_resource_ships", ["forum_id"], name: "index_forum_resource_ships_on_forum_id", using: :btree
  add_index "forum_resource_ships", ["resource_id"], name: "index_forum_resource_ships_on_resource_id", using: :btree
  add_index "forum_resource_ships", ["resource_type"], name: "index_forum_resource_ships_on_resource_type", using: :btree

  create_table "forums", force: :cascade do |t|
    t.string   "name",         limit: 255,   default: ""
    t.text     "intro",        limit: 65535
    t.text     "announce",     limit: 65535
    t.datetime "publish_date"
    t.boolean  "is_locked",                  default: false, null: false
    t.integer  "sort",         limit: 4,     default: 0,     null: false
    t.integer  "pageview",     limit: 4
    t.integer  "domain_id",    limit: 4
    t.boolean  "enabled",                    default: true,  null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "forums", ["domain_id"], name: "index_forums_on_domain_id", using: :btree
  add_index "forums", ["enabled"], name: "index_forums_on_enabled", using: :btree
  add_index "forums", ["is_locked"], name: "index_forums_on_is_locked", using: :btree
  add_index "forums", ["sort"], name: "index_forums_on_sort", using: :btree

  create_table "gem_article_contentfactory_ships", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.text     "intro",           limit: 65535
    t.integer  "editor_type",     limit: 4,     default: 1
    t.integer  "status",          limit: 4,     default: 1
    t.datetime "publish_date"
    t.integer  "publish_user_id", limit: 4
    t.integer  "top_type",        limit: 4,     default: 1
    t.datetime "datetime_from"
    t.text     "keywords",        limit: 65535
    t.integer  "domain_id",       limit: 4
    t.string   "cf_article_id",   limit: 255
    t.integer  "gem_article_id",  limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "gem_article_contentfactory_ships", ["cf_article_id"], name: "cf_gem_article_cf_article_id", using: :btree
  add_index "gem_article_contentfactory_ships", ["datetime_from"], name: "cf_gem_article_datetime_from", using: :btree
  add_index "gem_article_contentfactory_ships", ["domain_id"], name: "cf_gem_article_domain_id", using: :btree
  add_index "gem_article_contentfactory_ships", ["editor_type"], name: "cf_gem_article_editor_type", using: :btree
  add_index "gem_article_contentfactory_ships", ["gem_article_id"], name: "cf_gem_article_gem_article_id", using: :btree
  add_index "gem_article_contentfactory_ships", ["publish_date"], name: "cf_gem_article_publish_date", using: :btree
  add_index "gem_article_contentfactory_ships", ["publish_user_id"], name: "cf_gem_article_publish_user_id", using: :btree
  add_index "gem_article_contentfactory_ships", ["status"], name: "cf_gem_article_cf_status", using: :btree
  add_index "gem_article_contentfactory_ships", ["top_type"], name: "cf_gem_article_top_type", using: :btree

  create_table "gem_article_resource_ships", force: :cascade do |t|
    t.integer  "gem_article_id", limit: 4
    t.string   "resource_type",  limit: 30
    t.integer  "resource_id",    limit: 4
    t.integer  "recommend_type", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "gem_article_resource_ships", ["gem_article_id"], name: "index_gem_article_resource_ships_on_gem_article_id", using: :btree
  add_index "gem_article_resource_ships", ["resource_id"], name: "index_gem_article_resource_ships_on_resource_id", using: :btree
  add_index "gem_article_resource_ships", ["resource_type"], name: "index_gem_article_resource_ships_on_resource_type", using: :btree

  create_table "gem_articles", force: :cascade do |t|
    t.integer  "article_id",        limit: 4,                  null: false
    t.string   "title",             limit: 255,   default: ""
    t.text     "intro",             limit: 65535
    t.integer  "editor_type",       limit: 4,                  null: false
    t.integer  "status",            limit: 4,                  null: false
    t.datetime "recommend_date"
    t.integer  "recommend_user_id", limit: 4,     default: 3,  null: false
    t.datetime "audit_date"
    t.integer  "audit_user_id",     limit: 4,     default: 3,  null: false
    t.integer  "last_editor_id",    limit: 4
    t.text     "keywords",          limit: 65535
    t.integer  "top_type",          limit: 4,     default: 1,  null: false
    t.datetime "datetime_from"
    t.integer  "domain_id",         limit: 4,                  null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "gem_articles", ["article_id"], name: "index_gem_articles_on_article_id", using: :btree
  add_index "gem_articles", ["domain_id"], name: "index_gem_articles_on_domain_id", using: :btree
  add_index "gem_articles", ["top_type", "status", "domain_id", "datetime_from"], name: "headline", using: :btree

  create_table "gem_dir_article_ships", force: :cascade do |t|
    t.integer  "gem_dir_id",     limit: 4, default: -1, null: false
    t.integer  "gem_article_id", limit: 4, default: -1, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "gem_dir_article_ships", ["gem_article_id"], name: "index_gem_dir_article_ships_on_gem_article_id", using: :btree
  add_index "gem_dir_article_ships", ["gem_dir_id"], name: "index_gem_dir_article_ships_on_gem_dir_id", using: :btree

  create_table "gem_dirs", force: :cascade do |t|
    t.integer  "domain_id",         limit: 4,                  null: false
    t.string   "code",              limit: 255
    t.string   "name",              limit: 255,   default: ""
    t.text     "intro",             limit: 65535
    t.integer  "gem_article_count", limit: 4,     default: 0,  null: false
    t.integer  "sort",              limit: 4,     default: 0,  null: false
    t.boolean  "enabled",                                      null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "gem_dirs", ["domain_id"], name: "index_gem_dirs_on_domain_id", using: :btree
  add_index "gem_dirs", ["enabled"], name: "index_gem_dirs_on_enabled", using: :btree
  add_index "gem_dirs", ["sort"], name: "index_gem_dirs_on_sort", using: :btree

  create_table "halls", force: :cascade do |t|
    t.string   "name_local",           limit: 255,                          default: ""
    t.string   "name_en",              limit: 255
    t.integer  "sort",                 limit: 4,                            default: 99,     null: false
    t.integer  "domain_id",            limit: 4,                                             null: false
    t.decimal  "parameter_same_price",             precision: 20, scale: 4, default: 1000.0, null: false
    t.integer  "quote_status",         limit: 4,                            default: 0,      null: false
    t.boolean  "enabled",                                                   default: true,   null: false
    t.datetime "created_at",                                                                 null: false
    t.datetime "updated_at",                                                                 null: false
  end

  add_index "halls", ["domain_id"], name: "index_halls_on_domain_id", using: :btree
  add_index "halls", ["enabled"], name: "index_halls_on_enabled", using: :btree
  add_index "halls", ["quote_status"], name: "index_halls_on_quote_status", using: :btree
  add_index "halls", ["sort"], name: "index_halls_on_sort", using: :btree

  create_table "is_numerical_product_tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "is_save"
    t.boolean  "enabled"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "isp_fee_combo_logs", force: :cascade do |t|
    t.integer  "isp_fee_id",                   limit: 4
    t.integer  "isp_plan_id",                  limit: 4
    t.integer  "hall_id",                      limit: 4
    t.integer  "max_quote_value",              limit: 4
    t.datetime "update_time_of_original_data"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "isp_fee_combo_logs", ["isp_fee_id"], name: "index_isp_fee_combo_logs_on_isp_fee_id", using: :btree
  add_index "isp_fee_combo_logs", ["isp_plan_id"], name: "index_isp_fee_combo_logs_on_isp_plan_id", using: :btree

  create_table "isp_fee_combos", force: :cascade do |t|
    t.integer  "isp_fee_id",      limit: 4, null: false
    t.integer  "isp_plan_id",     limit: 4, null: false
    t.integer  "hall_id",         limit: 4, null: false
    t.integer  "max_quote_value", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "isp_fee_combos", ["hall_id"], name: "index_isp_fee_combos_on_hall_id", using: :btree
  add_index "isp_fee_combos", ["isp_fee_id"], name: "index_isp_fee_combos_on_isp_id", using: :btree
  add_index "isp_fee_combos", ["isp_plan_id"], name: "index_isp_fee_combos_on_isp_plan_id", using: :btree

  create_table "isp_fees", force: :cascade do |t|
    t.integer  "isp_vendor_id",   limit: 4
    t.integer  "isp_protocol_id", limit: 4
    t.string   "name",            limit: 255
    t.text     "explanation",     limit: 65535
    t.boolean  "enabled",                       default: true
    t.integer  "sort",            limit: 4
    t.integer  "hall_id",         limit: 4
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "isp_fees", ["enabled"], name: "index_isp_fees_on_enabled", using: :btree
  add_index "isp_fees", ["isp_protocol_id"], name: "index_isp_fees_on_isp_protocol_id", using: :btree
  add_index "isp_fees", ["isp_vendor_id"], name: "index_isp_fees_on_isp_id", using: :btree

  create_table "isp_plans", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "enabled",                default: true
    t.integer  "sort",       limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "isp_plans", ["enabled"], name: "index_isp_plans_on_enabled", using: :btree

  create_table "isp_protocols", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "enabled",                default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "isp_protocols", ["enabled"], name: "index_isp_protocols_on_enabled", using: :btree

  create_table "isp_vendors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "enabled",                default: true
    t.integer  "sort",       limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "isp_vendors", ["enabled"], name: "index_isp_vendors_on_enabled", using: :btree

  create_table "issue_replies", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.string   "user_name",  limit: 255
    t.integer  "user_id",    limit: 4,     null: false
    t.integer  "issue_id",   limit: 4,     null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "issue_replies", ["issue_id"], name: "index_issue_replies_on_issue_id", using: :btree
  add_index "issue_replies", ["user_id"], name: "index_issue_replies_on_user_id", using: :btree
  add_index "issue_replies", ["user_name"], name: "index_issue_replies_on_user_name", using: :btree

  create_table "issues", force: :cascade do |t|
    t.string   "name",                 limit: 255,                   null: false
    t.string   "email",                limit: 255,                   null: false
    t.string   "phone",                limit: 255
    t.string   "title",                limit: 255,                   null: false
    t.text     "content",              limit: 65535,                 null: false
    t.string   "ip",                   limit: 255
    t.integer  "question_category_id", limit: 4,                     null: false
    t.integer  "question_item_id",     limit: 4,                     null: false
    t.boolean  "is_reply",                           default: false
    t.integer  "domain_id",            limit: 4
    t.integer  "status",               limit: 4,     default: 1,     null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "issues", ["domain_id"], name: "index_issues_on_domain_id", using: :btree
  add_index "issues", ["email"], name: "index_issues_on_email", using: :btree
  add_index "issues", ["name"], name: "index_issues_on_name", using: :btree
  add_index "issues", ["question_category_id"], name: "index_issues_on_question_category_id", using: :btree
  add_index "issues", ["question_item_id"], name: "index_issues_on_question_item_id", using: :btree
  add_index "issues", ["status"], name: "index_issues_on_status", using: :btree

  create_table "managers", force: :cascade do |t|
    t.string   "account",    limit: 255
    t.string   "email",      limit: 255
    t.boolean  "enabled"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "managers", ["account", "email", "enabled"], name: "index_managers_on_account_and_email_and_enabled", using: :btree

  create_table "negotiation_request", primary_key: "negotiation_request_id", force: :cascade do |t|
    t.integer  "store_id",      limit: 4,                                      null: false
    t.integer  "product_id",    limit: 4,                                      null: false
    t.integer  "customer_id",   limit: 4,                                      null: false
    t.decimal  "product_price",           precision: 10, scale: 2,             null: false
    t.string   "price_type",    limit: 7,                                      null: false
    t.integer  "is_accepted",   limit: 4,                          default: 0, null: false
    t.integer  "is_invited",    limit: 4,                          default: 0, null: false
    t.datetime "created_date",                                                 null: false
  end

  create_table "notification_tracking", primary_key: "notification_tracking_id", force: :cascade do |t|
    t.integer  "sender_id",    limit: 4,                 null: false
    t.integer  "receiver_id",  limit: 4,                 null: false
    t.integer  "shop_id",      limit: 4,                 null: false
    t.binary   "message",      limit: 65535,             null: false
    t.integer  "is_viewed",    limit: 4,     default: 0, null: false
    t.datetime "created_date",                           null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string   "name",       limit: 255,   default: ""
    t.string   "code",       limit: 255
    t.string   "scope",      limit: 255
    t.text     "comment",    limit: 65535
    t.boolean  "enabled"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "pk_product_ships", force: :cascade do |t|
    t.integer  "pk_record_id", limit: 4
    t.integer  "prodcut_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "pk_product_ships", ["pk_record_id"], name: "index_pk_product_ships_on_record_id", using: :btree
  add_index "pk_product_ships", ["prodcut_id"], name: "index_pk_product_ships_on_prodcut_id", using: :btree

  create_table "pk_records", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.datetime "date"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "pk_records", ["user_id"], name: "index_pk_records_on_user_id", using: :btree

  create_table "plus_or_minus_records", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.text     "reason",     limit: 65535
    t.integer  "point",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "position_block_resource_ships", force: :cascade do |t|
    t.integer  "position_block_id", limit: 4
    t.integer  "resource_id",       limit: 4
    t.string   "resource_type",     limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "position_block_resource_ships", ["position_block_id"], name: "index_position_block_resource_ships_on_position_block_id", using: :btree
  add_index "position_block_resource_ships", ["resource_type", "resource_id"], name: "indexpositionblockresourceships_on_resource_type_and_resource_id", using: :btree

  create_table "position_blocks", force: :cascade do |t|
    t.integer  "block_type",              limit: 4
    t.string   "path_code",               limit: 255
    t.string   "name",                    limit: 255
    t.string   "label",                   limit: 255,   default: ""
    t.text     "desc",                    limit: 65535
    t.integer  "sort",                    limit: 4,     default: 99
    t.integer  "max_display",             limit: 4,     default: 0
    t.integer  "position_contents_count", limit: 4,     default: 0
    t.integer  "domain_id",               limit: 4
    t.datetime "datetime_from",                         default: '2012-10-13 12:34:37'
    t.datetime "datetime_to",                           default: '3013-10-13 12:34:37'
    t.boolean  "enabled",                               default: true
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
  end

  add_index "position_blocks", ["block_type"], name: "index_position_blocks_on_block_type", using: :btree
  add_index "position_blocks", ["domain_id"], name: "index_position_blocks_on_domain_id", using: :btree
  add_index "position_blocks", ["enabled"], name: "index_position_blocks_on_enabled", using: :btree
  add_index "position_blocks", ["max_display"], name: "index_position_blocks_on_max_display", using: :btree
  add_index "position_blocks", ["path_code"], name: "index_position_blocks_on_path_code", using: :btree
  add_index "position_blocks", ["sort"], name: "index_position_blocks_on_sort", using: :btree

  create_table "position_contents", force: :cascade do |t|
    t.integer  "position_block_id",  limit: 4
    t.datetime "datetime_from",                    default: '2012-10-13 12:34:37'
    t.datetime "datetime_to",                      default: '3013-10-13 12:34:37'
    t.string   "name",               limit: 255
    t.text     "content",            limit: 65535
    t.text     "responsive_content", limit: 65535
    t.string   "resource_type",      limit: 255
    t.integer  "resource_id",        limit: 4
    t.integer  "sort",               limit: 4,     default: 99
    t.boolean  "is_fixed",                         default: true
    t.boolean  "enabled",                          default: true
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
  end

  add_index "position_contents", ["position_block_id"], name: "index_position_contents_on_position_block_id", using: :btree

  create_table "price_robots", force: :cascade do |t|
    t.string   "source_type",   limit: 255
    t.string   "source_url",    limit: 255
    t.string   "source_name",   limit: 255
    t.string   "hall_type",     limit: 255
    t.string   "brand_name",    limit: 255
    t.string   "product_name",  limit: 255
    t.decimal  "price",                     precision: 20, scale: 4
    t.string   "currency_type", limit: 255
    t.datetime "update_time"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "product_contentfactory_ships", primary_key: "cf_product_id", force: :cascade do |t|
    t.string   "cf_name_normal",    limit: 255
    t.text     "cf_intro_detail",   limit: 65535
    t.string   "cf_currency",       limit: 255
    t.decimal  "cf_price_official",               precision: 20, scale: 4
    t.string   "cf_brand_id",       limit: 255
    t.string   "cf_domain_id",      limit: 255
    t.string   "cf_hall_id",        limit: 255
    t.text     "cf_seo_desc",       limit: 65535
    t.string   "cf_enabled",        limit: 255
    t.integer  "product_id",        limit: 4
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
  end

  add_index "product_contentfactory_ships", ["cf_brand_id"], name: "index_product_contentfactory_ships_on_cf_brand_id", using: :btree
  add_index "product_contentfactory_ships", ["cf_currency"], name: "index_product_contentfactory_ships_on_cf_currency", using: :btree
  add_index "product_contentfactory_ships", ["cf_domain_id"], name: "index_product_contentfactory_ships_on_cf_domain_id", using: :btree
  add_index "product_contentfactory_ships", ["cf_hall_id"], name: "index_product_contentfactory_ships_on_cf_hall_id", using: :btree
  add_index "product_contentfactory_ships", ["product_id"], name: "index_product_contentfactory_ships_on_product_id", using: :btree

  create_table "product_fet_ships", force: :cascade do |t|
    t.integer  "product_id", limit: 4, null: false
    t.integer  "guid",       limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "product_fet_ships", ["guid"], name: "index_product_fet_ships_on_guid", using: :btree
  add_index "product_fet_ships", ["product_id"], name: "index_product_fet_ships_on_product_id", using: :btree

  create_table "product_hot_pks", force: :cascade do |t|
    t.integer  "product_id",    limit: 4
    t.integer  "pk_prodcut_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "product_hot_pks", ["pk_prodcut_id"], name: "index_product_hot_pks_on_pk_prodcut_id", using: :btree
  add_index "product_hot_pks", ["product_id"], name: "index_product_hot_pks_on_product_id", using: :btree

  create_table "product_image_contentfactory_ships", primary_key: "cf_image_id", force: :cascade do |t|
    t.string   "cf_product_id",    limit: 255
    t.integer  "cf_categorized",   limit: 4
    t.text     "url_origin",       limit: 65535
    t.string   "url_extra_large",  limit: 255
    t.text     "url_big",          limit: 65535
    t.text     "url_medium",       limit: 65535
    t.text     "url_small",        limit: 65535
    t.integer  "product_image_id", limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "product_image_contentfactory_ships", ["cf_categorized"], name: "index_product_image_contentfactory_ships_on_cf_categorized", using: :btree
  add_index "product_image_contentfactory_ships", ["cf_product_id"], name: "index_product_image_contentfactory_ships_on_cf_product_id", using: :btree
  add_index "product_image_contentfactory_ships", ["product_image_id"], name: "index_product_image_contentfactory_ships_on_product_image_id", using: :btree

  create_table "product_images", force: :cascade do |t|
    t.integer  "categorized",     limit: 4,     default: 1
    t.string   "imageable_type",  limit: 255
    t.integer  "imageable_id",    limit: 4
    t.string   "file",            limit: 255
    t.string   "type_text",       limit: 255
    t.text     "url_origin",      limit: 65535
    t.text     "url_extra_large", limit: 65535
    t.text     "url_big",         limit: 65535
    t.text     "url_medium",      limit: 65535
    t.text     "url_small",       limit: 65535
    t.text     "url_thumb",       limit: 65535
    t.integer  "user_id",         limit: 4
    t.boolean  "watermark",                     default: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "product_images", ["categorized"], name: "index_product_images_on_categorized", using: :btree
  add_index "product_images", ["imageable_id"], name: "index_product_images_on_imageable_id", using: :btree
  add_index "product_images", ["imageable_type"], name: "index_product_images_on_imageable_type", using: :btree
  add_index "product_images", ["type_text"], name: "index_product_images_on_type_text", using: :btree
  add_index "product_images", ["user_id"], name: "index_product_images_on_user_id", using: :btree

  create_table "product_isp_vendor_ships", force: :cascade do |t|
    t.integer  "product_id",    limit: 4, null: false
    t.integer  "isp_vendor_id", limit: 4, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "product_price_displays", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.decimal  "max_price",            precision: 20, scale: 4
    t.decimal  "min_price",            precision: 20, scale: 4
    t.decimal  "avg_price",            precision: 20, scale: 4
    t.date     "date"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "product_price_displays", ["date"], name: "index_product_price_displays_on_date", using: :btree
  add_index "product_price_displays", ["product_id"], name: "index_product_price_displays_on_product_id", using: :btree

  create_table "product_price_robot_ships", force: :cascade do |t|
    t.integer  "product_id",     limit: 4, null: false
    t.integer  "price_robot_id", limit: 4, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "product_product_tag_ships", force: :cascade do |t|
    t.integer  "product_id",     limit: 4
    t.integer  "product_tag_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_product_tag_ships", ["product_id"], name: "index_product_product_tag_ships_on_product_id", using: :btree

  create_table "product_protocol_ships", force: :cascade do |t|
    t.integer  "product_id",      limit: 4
    t.integer  "isp_protocol_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "product_protocol_ships", ["isp_protocol_id"], name: "index_product_protocol_ships_on_isp_protocol_id", using: :btree
  add_index "product_protocol_ships", ["product_id"], name: "index_product_protocol_ships_on_product_id", using: :btree

  create_table "product_search_categories", force: :cascade do |t|
    t.integer  "product_tag_id", limit: 4
    t.string   "name",           limit: 255
    t.string   "url_keyword",    limit: 255
    t.integer  "sort",           limit: 4
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_search_items", force: :cascade do |t|
    t.integer  "product_search_category_id", limit: 4
    t.integer  "value_type",                 limit: 4
    t.string   "name",                       limit: 255
    t.integer  "sort",                       limit: 4
    t.integer  "max_number",                 limit: 4
    t.integer  "min_number",                 limit: 4
    t.string   "unit",                       limit: 255
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_spec_displays", force: :cascade do |t|
    t.integer  "product_id",      limit: 4
    t.integer  "spec_class_id",   limit: 4
    t.integer  "spec_id",         limit: 4
    t.string   "spec_name_local", limit: 255
    t.text     "spec_value",      limit: 65535
    t.string   "label_text",      limit: 255
    t.string   "label_style",     limit: 255
    t.integer  "sort",            limit: 4,     default: 0
    t.boolean  "enabled",                       default: true
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "product_spec_displays", ["enabled"], name: "index_product_spec_displays_on_enabled", using: :btree
  add_index "product_spec_displays", ["product_id"], name: "index_product_spec_displays_on_product_id", using: :btree
  add_index "product_spec_displays", ["sort"], name: "index_product_spec_displays_on_sort", using: :btree
  add_index "product_spec_displays", ["spec_class_id"], name: "index_product_spec_displays_on_spec_class_id", using: :btree
  add_index "product_spec_displays", ["spec_id"], name: "index_product_spec_displays_on_spec_id", using: :btree

  create_table "product_spec_value_contentfactory_ships", primary_key: "cf_spec_value_id", force: :cascade do |t|
    t.string   "cf_spec_id",                 limit: 255
    t.string   "cf_product_id",              limit: 255
    t.string   "value_text",                 limit: 255
    t.string   "value_unit",                 limit: 255
    t.integer  "product_spec_value_ship_id", limit: 4
    t.boolean  "enabled"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "product_spec_value_contentfactory_ships", ["cf_product_id"], name: "product_spec_value_cf_ship_cf_product_id", using: :btree
  add_index "product_spec_value_contentfactory_ships", ["cf_spec_id"], name: "product_spec_value_cf_ship_cf_spec_id", using: :btree
  add_index "product_spec_value_contentfactory_ships", ["enabled"], name: "product_spec_value_cf_ship_enabled", using: :btree
  add_index "product_spec_value_contentfactory_ships", ["product_spec_value_ship_id"], name: "product_spec_value_cf_ship_product_spec_value_ship_id", using: :btree

  create_table "product_spec_value_ships", force: :cascade do |t|
    t.integer  "product_id",       limit: 4
    t.integer  "spec_id",          limit: 4
    t.string   "alias_value_text", limit: 255
    t.string   "value_text",       limit: 255
    t.string   "value_unit",       limit: 255
    t.boolean  "enabled"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "product_spec_value_ships", ["enabled"], name: "index_product_spec_value_ships_on_enabled", using: :btree
  add_index "product_spec_value_ships", ["product_id"], name: "index_product_spec_value_ships_on_product_id", using: :btree
  add_index "product_spec_value_ships", ["spec_id", "value_text", "enabled"], name: "index_ProSpecValueShips_on_spec_id_and_value_text_and_enab", using: :btree
  add_index "product_spec_value_ships", ["spec_id"], name: "index_product_spec_value_ships_on_spec_id", using: :btree
  add_index "product_spec_value_ships", ["value_text"], name: "index_product_spec_value_ships_on_value_text", using: :btree
  add_index "product_spec_value_ships", ["value_unit"], name: "index_product_spec_value_ships_on_value_unit", using: :btree

  create_table "product_tag_product_search_item_ships", force: :cascade do |t|
    t.integer  "product_search_item_id", limit: 4
    t.integer  "product_tag_id",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_tag_quick_search_item_ships", force: :cascade do |t|
    t.integer  "product_tag_id",       limit: 4
    t.integer  "quick_search_item_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_tags", force: :cascade do |t|
    t.integer  "parent_id",  limit: 4
    t.integer  "value_type", limit: 4
    t.float    "value",      limit: 24
    t.string   "name",       limit: 255
    t.string   "unit",       limit: 255
    t.string   "full_path",  limit: 255
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_used_price_displays", force: :cascade do |t|
    t.integer  "product_id",     limit: 4
    t.decimal  "avg_used_price",           precision: 20, scale: 4
    t.date     "date"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  create_table "production_article_categories", force: :cascade do |t|
    t.integer  "sort",       limit: 4, default: 0,    null: false
    t.boolean  "enabled",              default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "production_article_categories", ["enabled"], name: "index_production_article_categories_on_enabled", using: :btree
  add_index "production_article_categories", ["sort"], name: "index_production_article_categories_on_sort", using: :btree

  create_table "production_article_category_translations", force: :cascade do |t|
    t.integer  "production_article_category_id", limit: 4
    t.string   "language",                       limit: 255, default: ""
    t.string   "name",                           limit: 255, default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "production_article_category_translations", ["language"], name: "production_article_category_translations_language", using: :btree
  add_index "production_article_category_translations", ["name"], name: "production_article_category_translations_name", using: :btree
  add_index "production_article_category_translations", ["production_article_category_id"], name: "production_article_category_translations_category_id", using: :btree

  create_table "production_article_contentfactory_ships", force: :cascade do |t|
    t.string   "language",                                  limit: 255,      default: ""
    t.string   "title",                                     limit: 255,      default: ""
    t.text     "content",                                   limit: 16777215
    t.integer  "author_user_id",                            limit: 4,        default: 3,  null: false
    t.string   "cf_article_id",                             limit: 255
    t.integer  "production_article_id",                     limit: 4
    t.integer  "production_article_translation_id",         limit: 4
    t.integer  "production_article_translation_content_id", limit: 4
    t.integer  "status",                                    limit: 4,        default: 1
    t.string   "url_keyword",                               limit: 500,      default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "production_article_contentfactory_ships", ["author_user_id"], name: "production_article_cf_article_author_user_id", using: :btree
  add_index "production_article_contentfactory_ships", ["production_article_translation_content_id"], name: "production_article_cf_article_content_id", using: :btree
  add_index "production_article_contentfactory_ships", ["production_article_translation_id"], name: "production_article_cf_article_id", using: :btree
  add_index "production_article_contentfactory_ships", ["status"], name: "production_article_cf_article_status", using: :btree

  create_table "production_article_cover_images", force: :cascade do |t|
    t.integer  "production_article_id", limit: 4
    t.string   "file",                  limit: 255
    t.text     "url_origin",            limit: 65535
    t.string   "url_headline",          limit: 255
    t.text     "url_extra_large",       limit: 65535
    t.text     "url_big",               limit: 65535
    t.text     "url_medium",            limit: 65535
    t.text     "url_small",             limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "production_article_cover_images", ["production_article_id"], name: "index_production_article_cover_images_on_production_article_id", using: :btree

  create_table "production_article_replies", force: :cascade do |t|
    t.integer  "production_article_id", limit: 4
    t.text     "content",               limit: 65535
    t.integer  "parent_id",             limit: 4
    t.integer  "user_id",               limit: 4
    t.boolean  "enabled",                             default: true, null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "production_article_replies", ["production_article_id"], name: "production_article_replies_production_article_id", using: :btree
  add_index "production_article_replies", ["user_id"], name: "index_production_article_replies_on_user_id", using: :btree

  create_table "production_article_resource_ships", force: :cascade do |t|
    t.integer  "production_article_id", limit: 4
    t.string   "resource_type",         limit: 30
    t.integer  "resource_id",           limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "production_article_resource_ships", ["production_article_id"], name: "index_production_article_resource_ships_on_production_article_id", using: :btree
  add_index "production_article_resource_ships", ["resource_id"], name: "index_production_article_resource_ships_on_resource_id", using: :btree
  add_index "production_article_resource_ships", ["resource_type"], name: "index_production_article_resource_ships_on_resource_type", using: :btree

  create_table "production_article_tag_ships", force: :cascade do |t|
    t.integer  "production_article_id",     limit: 4
    t.integer  "production_article_tag_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "production_article_tag_ships", ["production_article_id"], name: "index_production_article_tag_ships_on_production_article_id", using: :btree
  add_index "production_article_tag_ships", ["production_article_tag_id"], name: "index_production_article_tag_ships_on_production_article_tag_id", using: :btree

  create_table "production_article_tag_translations", force: :cascade do |t|
    t.integer  "production_article_tag_id", limit: 4
    t.string   "language",                  limit: 255, default: ""
    t.string   "name",                      limit: 255, default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "production_article_tag_translations", ["language"], name: "production_article_tag_translations_language", using: :btree
  add_index "production_article_tag_translations", ["name"], name: "production_article_tag_translations_tag_id_name", using: :btree
  add_index "production_article_tag_translations", ["production_article_tag_id"], name: "production_article_tag_translations_tag_id", using: :btree

  create_table "production_article_tags", force: :cascade do |t|
    t.integer  "sort",       limit: 4, default: 0,    null: false
    t.boolean  "enabled",              default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "production_article_tags", ["enabled"], name: "index_production_article_tags_on_enabled", using: :btree
  add_index "production_article_tags", ["sort"], name: "index_production_article_tags_on_sort", using: :btree

  create_table "production_article_translation_contents", force: :cascade do |t|
    t.integer  "production_article_translation_id", limit: 4,        null: false
    t.text     "content",                           limit: 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "production_article_translation_contents", ["production_article_translation_id"], name: "production_article_translation_contents_article_id", using: :btree

  create_table "production_article_translations", force: :cascade do |t|
    t.integer  "production_article_id", limit: 4,                  null: false
    t.string   "language",              limit: 255,   default: ""
    t.string   "title",                 limit: 255,   default: ""
    t.string   "view_title",            limit: 255,   default: ""
    t.text     "description",           limit: 65535
    t.string   "keywords",              limit: 500,   default: ""
    t.string   "url_keyword",           limit: 500,   default: ""
    t.integer  "author_user_id",        limit: 4,     default: 3,  null: false
    t.integer  "updated_user_id",       limit: 4,     default: 3,  null: false
    t.integer  "pageview",              limit: 4,     default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "production_article_translations", ["author_user_id"], name: "index_production_article_translations_on_author_user_id", using: :btree
  add_index "production_article_translations", ["language"], name: "index_production_article_translations_on_language", using: :btree
  add_index "production_article_translations", ["production_article_id"], name: "index_production_article_translations_on_production_article_id", using: :btree
  add_index "production_article_translations", ["title"], name: "index_production_article_translations_on_title", using: :btree
  add_index "production_article_translations", ["view_title"], name: "index_production_article_translations_on_view_title", using: :btree

  create_table "production_articles", force: :cascade do |t|
    t.integer  "production_article_category_id", limit: 4
    t.integer  "top_type",                       limit: 4,   default: 1
    t.string   "column_type",                    limit: 255
    t.datetime "datetime_from"
    t.datetime "display_date"
    t.boolean  "datetime_status",                            default: false
    t.boolean  "is_review",                                  default: false
    t.datetime "last_reply"
    t.integer  "replier_user_id",                limit: 4
    t.integer  "replies_count",                  limit: 4
    t.boolean  "status",                                     default: true,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "production_articles", ["datetime_from"], name: "index_production_articles_on_datetime_from", using: :btree
  add_index "production_articles", ["datetime_status", "display_date"], name: "index_production_articles_on_datetime_status_and_display_date", using: :btree
  add_index "production_articles", ["is_review"], name: "index_production_articles_on_is_review", using: :btree
  add_index "production_articles", ["production_article_category_id"], name: "index_production_articles_on_production_article_category_id", using: :btree
  add_index "production_articles", ["status"], name: "index_production_articles_on_status", using: :btree
  add_index "production_articles", ["top_type"], name: "index_production_articles_on_top_type", using: :btree

  create_table "products", force: :cascade do |t|
    t.integer  "brand_id",               limit: 4
    t.integer  "domain_id",              limit: 4
    t.integer  "hall_id",                limit: 4
    t.integer  "repair_model_id",        limit: 4
    t.string   "name_normal",            limit: 255
    t.string   "name_local",             limit: 255
    t.string   "url_keyword",            limit: 255
    t.decimal  "price_official",                       precision: 20, scale: 4
    t.decimal  "price_avg_quote",                      precision: 20, scale: 4
    t.decimal  "used_price_avg_quote",                 precision: 20, scale: 4
    t.string   "currency",               limit: 255
    t.boolean  "enabled",                                                       default: true
    t.boolean  "is_quote",                                                      default: false
    t.datetime "quote_date"
    t.datetime "quote_close_date"
    t.integer  "market_status",          limit: 4,                              default: 177
    t.date     "market_date"
    t.string   "market_date_desc",       limit: 255
    t.text     "intro_abstract",         limit: 65535
    t.text     "intro_detail",           limit: 65535
    t.integer  "pageview_week",          limit: 4
    t.integer  "pageview_previous_week", limit: 4
    t.integer  "pageview",               limit: 4
    t.integer  "pageview_week_price",    limit: 4
    t.integer  "pageview_price",         limit: 4
    t.integer  "creator_id",             limit: 4
    t.text     "seo_desc",               limit: 65535
    t.text     "keyword",                limit: 65535
    t.text     "title_aliases",          limit: 65535
    t.string   "part_number",            limit: 255
    t.datetime "created_at",                                                                    null: false
    t.datetime "updated_at",                                                                    null: false
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id", using: :btree
  add_index "products", ["creator_id"], name: "index_products_on_creator_id", using: :btree
  add_index "products", ["domain_id"], name: "index_products_on_domain_id", using: :btree
  add_index "products", ["enabled"], name: "index_products_on_enabled", using: :btree
  add_index "products", ["hall_id"], name: "index_products_on_hall_id", using: :btree
  add_index "products", ["is_quote"], name: "index_products_on_is_quote", using: :btree
  add_index "products", ["market_status"], name: "index_products_on_market_status", using: :btree
  add_index "products", ["pageview"], name: "index_products_on_pageview", using: :btree
  add_index "products", ["pageview_previous_week"], name: "index_products_on_pageview_previous_week", using: :btree
  add_index "products", ["pageview_price"], name: "index_products_on_pageview_price", using: :btree
  add_index "products", ["pageview_week"], name: "index_products_on_pageview_week", using: :btree
  add_index "products", ["pageview_week_price"], name: "index_products_on_pageview_week_price", using: :btree
  add_index "products", ["price_avg_quote"], name: "index_products_on_price_avg_quote", using: :btree

  create_table "question_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "sort",       limit: 4,   default: 0,    null: false
    t.integer  "domain_id",  limit: 4
    t.boolean  "enabled",                default: true, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "question_categories", ["domain_id"], name: "index_question_categories_on_domain_id", using: :btree
  add_index "question_categories", ["enabled"], name: "index_question_categories_on_enabled", using: :btree

  create_table "question_items", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.integer  "sort",                 limit: 4,   default: 0,    null: false
    t.integer  "question_category_id", limit: 4
    t.integer  "domain_id",            limit: 4,                  null: false
    t.boolean  "enabled",                          default: true, null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "question_items", ["domain_id"], name: "index_question_items_on_domain_id", using: :btree
  add_index "question_items", ["enabled"], name: "index_question_items_on_enabled", using: :btree
  add_index "question_items", ["question_category_id"], name: "index_question_items_on_question_category_id", using: :btree

  create_table "question_replies", force: :cascade do |t|
    t.integer  "question_id", limit: 4
    t.text     "content",     limit: 65535
    t.integer  "reply_from",  limit: 4
    t.integer  "replier_id",  limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "question_replies", ["question_id"], name: "index_question_replies_on_question_id", using: :btree
  add_index "question_replies", ["replier_id"], name: "index_question_replies_on_replier_id", using: :btree
  add_index "question_replies", ["reply_from"], name: "index_question_replies_on_reply_from", using: :btree

  create_table "question_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "sort",       limit: 4
    t.integer  "category",   limit: 4
    t.integer  "domain_id",  limit: 4
    t.boolean  "enabled"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "question_types", ["category"], name: "index_question_types_on_category", using: :btree
  add_index "question_types", ["domain_id"], name: "index_question_types_on_domain_id", using: :btree
  add_index "question_types", ["enabled"], name: "index_question_types_on_enabled", using: :btree
  add_index "question_types", ["sort"], name: "index_question_types_on_sort", using: :btree

  create_table "questions", force: :cascade do |t|
    t.integer  "question_type_id", limit: 4
    t.string   "resource_type",    limit: 255
    t.integer  "resource_id",      limit: 4
    t.text     "content",          limit: 65535
    t.boolean  "is_readed"
    t.boolean  "is_reply"
    t.integer  "status",           limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "anonymous_email",  limit: 65535
    t.text     "anonymous_name",   limit: 65535
    t.text     "anonymous_phone",  limit: 65535
  end

  add_index "questions", ["is_readed"], name: "index_questions_on_is_readed", using: :btree
  add_index "questions", ["is_reply"], name: "index_questions_on_is_reply", using: :btree
  add_index "questions", ["question_type_id"], name: "index_questions_on_question_type_id", using: :btree
  add_index "questions", ["resource_id"], name: "index_questions_on_resource_id", using: :btree
  add_index "questions", ["resource_type"], name: "index_questions_on_resource_type", using: :btree
  add_index "questions", ["status"], name: "index_questions_on_status", using: :btree

  create_table "quick_search_items", force: :cascade do |t|
    t.integer  "product_tag_id", limit: 4
    t.string   "name",           limit: 255
    t.integer  "sort",           limit: 4
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "enabled",                default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "regions", ["enabled"], name: "index_regions_on_enabled", using: :btree

  create_table "repair_brands", force: :cascade do |t|
    t.string   "name",       limit: 255,                null: false
    t.string   "intro",      limit: 255
    t.integer  "sort",       limit: 4,   default: 99
    t.boolean  "enabled",                default: true, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "repair_brands", ["enabled"], name: "index_repair_brands_on_enabled", using: :btree
  add_index "repair_brands", ["name"], name: "index_repair_brands_on_name", using: :btree
  add_index "repair_brands", ["sort"], name: "index_repair_brands_on_sort", using: :btree

  create_table "repair_colors", force: :cascade do |t|
    t.string   "name",       limit: 255,                null: false
    t.integer  "sort",       limit: 4,   default: 99
    t.boolean  "enabled",                default: true, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "repair_colors", ["enabled"], name: "index_repair_colors_on_enabled", using: :btree
  add_index "repair_colors", ["name"], name: "index_repair_colors_on_name", using: :btree

  create_table "repair_components", force: :cascade do |t|
    t.string   "name",       limit: 255,                null: false
    t.integer  "sort",       limit: 4,   default: 99
    t.boolean  "enabled",                default: true, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "repair_components", ["enabled"], name: "index_repair_components_on_enabled", using: :btree
  add_index "repair_components", ["name"], name: "index_repair_components_on_name", using: :btree
  add_index "repair_components", ["sort"], name: "index_repair_components_on_sort", using: :btree

  create_table "repair_issue_details", force: :cascade do |t|
    t.integer  "repair_component_id", limit: 4,                  null: false
    t.integer  "repair_issue_id",     limit: 4,                  null: false
    t.integer  "related_talk_id",     limit: 4
    t.string   "name",                limit: 255,                null: false
    t.string   "remark",              limit: 255
    t.integer  "sort",                limit: 4,   default: 99
    t.boolean  "enabled",                         default: true, null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "repair_issue_details", ["enabled"], name: "index_repair_issue_details_on_enabled", using: :btree
  add_index "repair_issue_details", ["name"], name: "index_repair_issue_details_on_name", using: :btree
  add_index "repair_issue_details", ["repair_component_id"], name: "index_repair_issue_details_on_repair_component_id", using: :btree
  add_index "repair_issue_details", ["repair_issue_id"], name: "index_repair_issue_details_on_repair_issue_id", using: :btree
  add_index "repair_issue_details", ["sort"], name: "index_repair_issue_details_on_sort", using: :btree

  create_table "repair_issues", force: :cascade do |t|
    t.string   "name",       limit: 255,                null: false
    t.integer  "sort",       limit: 4,   default: 99
    t.boolean  "enabled",                default: true, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "repair_issues", ["enabled"], name: "index_repair_issues_on_enabled", using: :btree
  add_index "repair_issues", ["name"], name: "index_repair_issues_on_name", using: :btree
  add_index "repair_issues", ["sort"], name: "index_repair_issues_on_sort", using: :btree

  create_table "repair_model_color_ships", force: :cascade do |t|
    t.integer  "repair_model_id", limit: 4
    t.integer  "repair_color_id", limit: 4, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "repair_models", force: :cascade do |t|
    t.integer  "repair_brand_id",    limit: 4,                  null: false
    t.integer  "typical_product_id", limit: 4
    t.string   "name",               limit: 255,                null: false
    t.integer  "sort",               limit: 4,   default: 99
    t.boolean  "enabled",                        default: true, null: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "repair_models", ["enabled"], name: "index_repair_models_on_enabled", using: :btree
  add_index "repair_models", ["name"], name: "index_repair_models_on_name", using: :btree
  add_index "repair_models", ["repair_brand_id"], name: "index_repair_models_on_repair_brand_id", using: :btree
  add_index "repair_models", ["sort"], name: "index_repair_models_on_sort", using: :btree

  create_table "repair_products", force: :cascade do |t|
    t.integer  "repair_model_id",      limit: 4,                                         null: false
    t.integer  "repair_component_id",  limit: 4,                                         null: false
    t.decimal  "max_price",                      precision: 20, scale: 4
    t.decimal  "min_price",                      precision: 20, scale: 4
    t.date     "lock_price_date_to"
    t.datetime "lock_price_update_at"
    t.boolean  "enabled",                                                 default: true, null: false
    t.datetime "open_date"
    t.datetime "created_at",                                                             null: false
    t.datetime "updated_at",                                                             null: false
  end

  add_index "repair_products", ["enabled"], name: "index_repair_products_on_enabled", using: :btree
  add_index "repair_products", ["repair_component_id"], name: "index_repair_products_on_repair_component_id", using: :btree
  add_index "repair_products", ["repair_model_id"], name: "index_repair_products_on_repair_model_id", using: :btree

  create_table "repair_quotes", force: :cascade do |t|
    t.integer  "shop_id",           limit: 4,                                              null: false
    t.integer  "repair_product_id", limit: 4,                                              null: false
    t.decimal  "price",                           precision: 20, scale: 4
    t.integer  "repair_time",       limit: 4
    t.boolean  "on_site",                                                  default: false, null: false
    t.text     "intro",             limit: 65535
    t.integer  "warranty",          limit: 4
    t.boolean  "enabled",                                                  default: true,  null: false
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
  end

  add_index "repair_quotes", ["enabled"], name: "index_repair_quotes_on_enabled", using: :btree
  add_index "repair_quotes", ["price"], name: "index_repair_quotes_on_price", using: :btree
  add_index "repair_quotes", ["repair_product_id"], name: "index_repair_quotes_on_repair_product_id", using: :btree
  add_index "repair_quotes", ["shop_id"], name: "index_repair_quotes_on_shop_id", using: :btree

  create_table "review", primary_key: "review_id", force: :cascade do |t|
    t.integer  "product_id",   limit: 4,     null: false
    t.integer  "customer_id",  limit: 4,     null: false
    t.text     "review_text",  limit: 65535, null: false
    t.datetime "created_date",               null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255, default: ""
    t.integer  "level",      limit: 4,   default: 0,     null: false
    t.boolean  "enabled",                default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "rtmm_brand_preferences", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "rtmm_categories", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "group",            limit: 255
    t.string   "position",         limit: 255
    t.string   "price",            limit: 255
    t.string   "brand_preference", limit: 255
    t.string   "product_color",    limit: 255
    t.string   "prefecture",       limit: 255
    t.string   "other_prefecture", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rtmm_groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "rtmm_histories", force: :cascade do |t|
    t.string   "who",            limit: 255
    t.string   "key",            limit: 255
    t.string   "val",            limit: 255
    t.integer  "residence_time", limit: 4
    t.string   "category",       limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "rtmm_other_prefectures", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "rtmm_positions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "rtmm_prefectures", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "rtmm_prices", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "value",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "rtmm_product_colors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "rtmm_users", force: :cascade do |t|
    t.string   "who",        limit: 255
    t.integer  "category",   limit: 4
    t.boolean  "is_online"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "rtmms", force: :cascade do |t|
    t.string   "who",           limit: 255
    t.string   "key",           limit: 255
    t.string   "val",           limit: 255
    t.integer  "rtmm_category", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "setting_ses", force: :cascade do |t|
    t.string   "access_key_id",     limit: 255
    t.string   "secret_access_key", limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "shop_announce_ships", force: :cascade do |t|
    t.integer  "shop_id",          limit: 4
    t.integer  "shop_announce_id", limit: 4
    t.boolean  "is_readed",                  default: false
    t.boolean  "enabled",                    default: true
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "shop_announce_ships", ["shop_announce_id"], name: "index_shop_announce_ships_on_shop_announce_id", using: :btree
  add_index "shop_announce_ships", ["shop_id"], name: "index_shop_announce_ships_on_shop_id", using: :btree

  create_table "shop_announces", force: :cascade do |t|
    t.string   "announce_type", limit: 255
    t.string   "title",         limit: 255
    t.text     "content",       limit: 65535
    t.integer  "region_id",     limit: 4
    t.integer  "city_id",       limit: 4
    t.integer  "publisher_id",  limit: 4
    t.date     "date_from"
    t.date     "date_to"
    t.integer  "scope_status",  limit: 4
    t.integer  "domain_id",     limit: 4
    t.integer  "sort",          limit: 4,     default: 99
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "shop_announces", ["city_id"], name: "index_shop_announces_on_city_id", using: :btree
  add_index "shop_announces", ["date_from"], name: "index_shop_announces_on_date_from", using: :btree
  add_index "shop_announces", ["date_to"], name: "index_shop_announces_on_date_to", using: :btree
  add_index "shop_announces", ["domain_id"], name: "index_shop_announces_on_domain_id", using: :btree
  add_index "shop_announces", ["publisher_id"], name: "index_shop_announces_on_publisher_id", using: :btree
  add_index "shop_announces", ["region_id"], name: "index_shop_announces_on_region_id", using: :btree

  create_table "shop_hall_quote_ships", force: :cascade do |t|
    t.integer  "shop_id",    limit: 4
    t.integer  "hall_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "shop_hall_quote_ships", ["hall_id"], name: "index_shop_hall_quote_ships_on_hall_id", using: :btree
  add_index "shop_hall_quote_ships", ["shop_id"], name: "index_shop_hall_quote_ships_on_shop_id", using: :btree

  create_table "shop_images", force: :cascade do |t|
    t.integer  "categorized",     limit: 4,     default: 1
    t.string   "imageable_type",  limit: 255
    t.integer  "imageable_id",    limit: 4
    t.string   "file",            limit: 255
    t.string   "type_text",       limit: 255
    t.text     "url_origin",      limit: 65535
    t.string   "url_extra_large", limit: 255
    t.text     "url_big",         limit: 65535
    t.text     "url_medium",      limit: 65535
    t.text     "url_small",       limit: 65535
    t.text     "url_thumb",       limit: 65535
    t.integer  "user_id",         limit: 4
    t.boolean  "watermark",                     default: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "shop_images", ["categorized"], name: "index_shop_images_on_categorized", using: :btree
  add_index "shop_images", ["imageable_id"], name: "index_shop_images_on_imageable_id", using: :btree
  add_index "shop_images", ["imageable_type"], name: "index_shop_images_on_imageable_type", using: :btree
  add_index "shop_images", ["type_text"], name: "index_shop_images_on_type_text", using: :btree
  add_index "shop_images", ["user_id"], name: "index_shop_images_on_user_id", using: :btree

  create_table "shop_infos", force: :cascade do |t|
    t.integer  "shop_id",                  limit: 4
    t.integer  "city_id",                  limit: 4
    t.string   "name",                     limit: 255
    t.string   "telphone",                 limit: 255
    t.string   "address",                  limit: 255
    t.string   "longitude",                limit: 255
    t.string   "latitude",                 limit: 255
    t.boolean  "is_use_streetview",                    default: false
    t.string   "weekday_office_hour_from", limit: 255
    t.string   "weekday_office_hour_to",   limit: 255
    t.string   "holiday_office_hour_from", limit: 255
    t.string   "holiday_office_hour_to",   limit: 255
    t.string   "official_holiday",         limit: 255
    t.boolean  "status",                               default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shop_infos", ["status"], name: "index_shop_infos_on_status", using: :btree

  create_table "shop_isp_fee_discounts", force: :cascade do |t|
    t.integer  "shop_id",          limit: 4
    t.integer  "isp_fee_combo_id", limit: 4
    t.integer  "discount",         limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "shop_isp_fee_discounts", ["isp_fee_combo_id"], name: "index_shop_isp_fee_discounts_on_isp_fee_combo_id", using: :btree
  add_index "shop_isp_fee_discounts", ["shop_id"], name: "index_shop_isp_fee_discounts_on_shop_id", using: :btree

  create_table "shop_isp_fee_discounts_backup", force: :cascade do |t|
    t.integer  "shop_id",          limit: 4
    t.integer  "isp_fee_combo_id", limit: 4
    t.integer  "discount",         limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "shop_isp_fee_discounts_backup", ["isp_fee_combo_id"], name: "index_shop_isp_fee_discounts_on_isp_fee_combo_id", using: :btree
  add_index "shop_isp_fee_discounts_backup", ["shop_id"], name: "index_shop_isp_fee_discounts_on_shop_id", using: :btree

  create_table "shop_payment_ships", force: :cascade do |t|
    t.integer  "shop_info_id",    limit: 4, null: false
    t.integer  "shop_payment_id", limit: 4, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "shop_payment_ships", ["shop_info_id"], name: "index_shop_payment_ships_on_shop_info_id", using: :btree
  add_index "shop_payment_ships", ["shop_payment_id"], name: "index_shop_payment_ships_on_shop_payment_id", using: :btree

  create_table "shop_payments", force: :cascade do |t|
    t.string   "name",       limit: 255,                null: false
    t.integer  "domain_id",  limit: 4
    t.boolean  "enabled",                default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "shop_product_quote_lock_logs", force: :cascade do |t|
    t.integer  "city_id",                      limit: 4
    t.integer  "product_id",                   limit: 4
    t.decimal  "min_lite_price",                         precision: 20, scale: 4
    t.decimal  "max_lite_price",                         precision: 20, scale: 4
    t.decimal  "min_full_price",                         precision: 20, scale: 4
    t.decimal  "max_full_price",                         precision: 20, scale: 4
    t.datetime "date_to"
    t.boolean  "is_for_all",                                                      default: true
    t.datetime "update_time_of_original_data"
    t.datetime "created_at",                                                                     null: false
    t.datetime "updated_at",                                                                     null: false
  end

  add_index "shop_product_quote_lock_logs", ["city_id"], name: "index_shop_product_quote_lock_logs_on_city_id", using: :btree
  add_index "shop_product_quote_lock_logs", ["is_for_all"], name: "index_shop_product_quote_lock_logs_on_is_for_all", using: :btree
  add_index "shop_product_quote_lock_logs", ["product_id"], name: "index_shop_product_quote_lock_logs_on_product_id", using: :btree

  create_table "shop_product_quote_locks", force: :cascade do |t|
    t.integer  "city_id",        limit: 4
    t.integer  "product_id",     limit: 4
    t.decimal  "min_lite_price",           precision: 20, scale: 4
    t.decimal  "max_lite_price",           precision: 20, scale: 4
    t.decimal  "min_full_price",           precision: 20, scale: 4
    t.decimal  "max_full_price",           precision: 20, scale: 4
    t.datetime "date_to"
    t.boolean  "is_for_all",                                        default: true
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
  end

  add_index "shop_product_quote_locks", ["city_id"], name: "index_shop_product_quote_locks_on_city_id", using: :btree
  add_index "shop_product_quote_locks", ["is_for_all"], name: "index_shop_product_quote_locks_on_is_for_all", using: :btree
  add_index "shop_product_quote_locks", ["product_id"], name: "index_shop_product_quote_locks_on_product_id", using: :btree

  create_table "shop_promotes", force: :cascade do |t|
    t.integer  "promote_type",  limit: 4
    t.integer  "shop_id",       limit: 4
    t.integer  "product_id",    limit: 4
    t.integer  "hall_id",       limit: 4
    t.integer  "shop_quote_id", limit: 4
    t.text     "desc",          limit: 65535
    t.datetime "date_from"
    t.datetime "date_to"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "shop_promotes", ["hall_id"], name: "index_shop_promotes_on_hall_id", using: :btree
  add_index "shop_promotes", ["product_id"], name: "index_shop_promotes_on_product_id", using: :btree
  add_index "shop_promotes", ["promote_type"], name: "index_shop_promotes_on_promote_type", using: :btree
  add_index "shop_promotes", ["shop_id"], name: "index_shop_promotes_on_shop_id", using: :btree
  add_index "shop_promotes", ["shop_quote_id"], name: "index_shop_promotes_on_shop_quote_id", using: :btree

  create_table "shop_quote_logs", force: :cascade do |t|
    t.integer  "shop_id",                      limit: 4
    t.decimal  "quote_price",                                precision: 20, scale: 4
    t.decimal  "full_quote_price",                           precision: 20, scale: 4
    t.integer  "product_id",                   limit: 4
    t.text     "intro",                        limit: 65535
    t.integer  "hall_id",                      limit: 4
    t.datetime "update_time"
    t.boolean  "enabled",                                                             default: true
    t.datetime "update_time_of_original_data"
    t.datetime "created_at",                                                                         null: false
    t.datetime "updated_at",                                                                         null: false
  end

  add_index "shop_quote_logs", ["enabled"], name: "index_shop_quote_logs_on_enabled", using: :btree
  add_index "shop_quote_logs", ["hall_id"], name: "index_shop_quote_logs_on_hall_id", using: :btree
  add_index "shop_quote_logs", ["product_id"], name: "index_shop_quote_logs_on_product_id", using: :btree
  add_index "shop_quote_logs", ["shop_id"], name: "index_shop_quote_logs_on_shop_id", using: :btree

  create_table "shop_quotes", force: :cascade do |t|
    t.integer  "shop_id",          limit: 4
    t.decimal  "quote_price",                    precision: 20, scale: 4
    t.decimal  "full_quote_price",               precision: 20, scale: 4
    t.integer  "product_id",       limit: 4
    t.text     "intro",            limit: 65535
    t.integer  "own_status",       limit: 4,                              default: 2
    t.integer  "hall_id",          limit: 4
    t.datetime "update_time"
    t.boolean  "enabled",                                                 default: true
    t.datetime "created_at",                                                             null: false
    t.datetime "updated_at",                                                             null: false
  end

  add_index "shop_quotes", ["enabled"], name: "index_shop_quotes_on_enabled", using: :btree
  add_index "shop_quotes", ["hall_id"], name: "index_shop_quotes_on_hall_id", using: :btree
  add_index "shop_quotes", ["product_id"], name: "index_shop_quotes_on_product_id", using: :btree
  add_index "shop_quotes", ["shop_id", "product_id", "hall_id", "enabled"], name: "index_shop_quotes_on_shop_product_hall_enabled", using: :btree
  add_index "shop_quotes", ["shop_id"], name: "index_shop_quotes_on_shop_id", using: :btree

  create_table "shop_service_ships", force: :cascade do |t|
    t.integer  "shop_info_id",    limit: 4, null: false
    t.integer  "shop_service_id", limit: 4, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "shop_service_ships", ["shop_info_id"], name: "index_shop_service_ships_on_shop_info_id", using: :btree
  add_index "shop_service_ships", ["shop_service_id"], name: "index_shop_service_ships_on_shop_service_id", using: :btree

  create_table "shop_services", force: :cascade do |t|
    t.string   "name",       limit: 255,                null: false
    t.integer  "domain_id",  limit: 4
    t.boolean  "enabled",                default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "shop_used_images", force: :cascade do |t|
    t.integer  "shop_used_id",    limit: 4,     null: false
    t.integer  "categorized",     limit: 4
    t.string   "file",            limit: 255
    t.text     "url_origin",      limit: 65535
    t.text     "url_extra_large", limit: 65535
    t.text     "url_big",         limit: 65535
    t.text     "url_medium",      limit: 65535
    t.text     "url_small",       limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "shop_used_images", ["shop_used_id"], name: "index_shop_used_images_on_shop_used_id", using: :btree

  create_table "shop_useds", force: :cascade do |t|
    t.integer  "shop_info_id",  limit: 4,                              null: false
    t.integer  "product_id",    limit: 4,                              null: false
    t.decimal  "price",                       precision: 20, scale: 4
    t.text     "description",   limit: 65535
    t.integer  "used_status",   limit: 4
    t.integer  "source",        limit: 4
    t.integer  "used_warranty", limit: 4
    t.boolean  "enabled"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  add_index "shop_useds", ["product_id"], name: "index_shop_useds_on_product_id", using: :btree
  add_index "shop_useds", ["shop_info_id"], name: "index_shop_useds_on_shop_info_id", using: :btree

  create_table "shops", force: :cascade do |t|
    t.string   "name",                          limit: 255
    t.text     "intro",                         limit: 65535
    t.text     "promotions_description",        limit: 65535
    t.text     "repair_promotions_description", limit: 65535
    t.date     "contract_deadline_date"
    t.integer  "owner_user_id",                 limit: 4
    t.string   "owner_name",                    limit: 255
    t.string   "telphone",                      limit: 255
    t.string   "cellphone",                     limit: 255
    t.string   "email",                         limit: 255
    t.string   "address",                       limit: 255
    t.string   "fb_page_url",                   limit: 255
    t.boolean  "can_shop_quote",                              default: true
    t.boolean  "can_shop_used",                               default: false
    t.boolean  "can_repair_quote",                            default: false
    t.boolean  "can_housecall",                               default: false
    t.boolean  "have_reserve_machine",                        default: false
    t.boolean  "can_own_status",                              default: false
    t.boolean  "can_on_site",                                 default: false
    t.boolean  "email_enabled"
    t.integer  "domain_id",                     limit: 4
    t.integer  "status",                        limit: 4,     default: 0,     null: false
    t.boolean  "have_notice"
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
  end

  add_index "shops", ["contract_deadline_date"], name: "index_shops_on_contract_deadline_date", using: :btree
  add_index "shops", ["owner_user_id"], name: "index_shops_on_owner_user_id", using: :btree
  add_index "shops", ["status"], name: "index_shops_on_status", using: :btree

  create_table "simple_captcha_data", force: :cascade do |t|
    t.string   "key",        limit: 40
    t.string   "value",      limit: 6
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "simple_captcha_data", ["key"], name: "idx_key", using: :btree

  create_table "spec_class_contentfactory_ships", primary_key: "cf_spec_class_id", force: :cascade do |t|
    t.string   "name_local",    limit: 255
    t.integer  "spec_class_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "spec_class_contentfactory_ships", ["spec_class_id"], name: "index_spec_class_contentfactory_ships_on_spec_class_id", using: :btree

  create_table "spec_classes", force: :cascade do |t|
    t.string   "name_local", limit: 255
    t.string   "name_alias", limit: 255
    t.integer  "sort",       limit: 4
    t.integer  "hall_id",    limit: 4
    t.boolean  "enabled",                default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "spec_classes", ["enabled"], name: "index_spec_classes_on_enabled", using: :btree
  add_index "spec_classes", ["hall_id"], name: "index_spec_classes_on_hall_id", using: :btree
  add_index "spec_classes", ["sort"], name: "index_spec_classes_on_sort", using: :btree

  create_table "spec_contentfactory_ships", primary_key: "cf_spec_id", force: :cascade do |t|
    t.string   "cf_spec_class_id", limit: 255
    t.string   "name_local",       limit: 255
    t.integer  "spec_id",          limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "spec_contentfactory_ships", ["cf_spec_class_id"], name: "index_spec_contentfactory_ships_on_cf_spec_class_id", using: :btree
  add_index "spec_contentfactory_ships", ["spec_id"], name: "index_spec_contentfactory_ships_on_spec_id", using: :btree

  create_table "spec_value_groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "content",    limit: 65535
    t.integer  "hall_id",    limit: 4
    t.boolean  "enabled"
    t.integer  "sort",       limit: 4
    t.boolean  "precision"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "spec_value_groups", ["enabled"], name: "index_spec_value_groups_on_enabled", using: :btree
  add_index "spec_value_groups", ["name"], name: "index_spec_value_groups_on_name", using: :btree
  add_index "spec_value_groups", ["sort"], name: "index_spec_value_groups_on_sort", using: :btree

  create_table "specs", force: :cascade do |t|
    t.string   "name_local",    limit: 255
    t.string   "name_alias",    limit: 255
    t.text     "desc",          limit: 65535
    t.integer  "sort",          limit: 4
    t.integer  "spec_class_id", limit: 4
    t.boolean  "is_focus",                    default: false
    t.boolean  "enabled",                     default: true
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "specs", ["enabled"], name: "index_specs_on_enabled", using: :btree
  add_index "specs", ["is_focus"], name: "index_specs_on_is_simple_display", using: :btree
  add_index "specs", ["sort"], name: "index_specs_on_sort", using: :btree
  add_index "specs", ["spec_class_id"], name: "index_specs_on_spec_class_id", using: :btree

  create_table "statistics_displays", force: :cascade do |t|
    t.string   "name_code",  limit: 255,   null: false
    t.text     "obj_ids",    limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "template_content_lists", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "style",               limit: 255
    t.integer  "template_id",         limit: 4
    t.integer  "template_content_id", limit: 4
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "sort",                limit: 4
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "template_contents", force: :cascade do |t|
    t.text     "template_content_hash", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "templates", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "sort",       limit: 4
    t.integer  "quantity",   limit: 4
    t.boolean  "enabled"
    t.text     "native_ads", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topic_contents", force: :cascade do |t|
    t.text     "content",        limit: 65535
    t.integer  "topic_id",       limit: 4
    t.integer  "topic_style_id", limit: 4
    t.integer  "sort",           limit: 4,     default: 1
    t.boolean  "enabled",                      default: true, null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "topic_contents", ["sort", "enabled"], name: "index_topic_contents_on_sort_and_enabled", using: :btree
  add_index "topic_contents", ["topic_id"], name: "index_topic_contents_on_topic_id", using: :btree
  add_index "topic_contents", ["topic_style_id"], name: "index_topic_contents_on_topic_style_id", using: :btree

  create_table "topic_styles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "limit_num",  limit: 4
    t.string   "code",       limit: 255
    t.string   "image",      limit: 255
    t.text     "basic_hash", limit: 65535
    t.boolean  "enabled",                  default: true, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "topic_styles", ["enabled"], name: "index_topic_styles_on_enabled", using: :btree

  create_table "topic_templates", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "style_ids",  limit: 65535
    t.boolean  "enabled",                  default: true
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "topic_templates", ["enabled"], name: "index_topic_templates_on_enabled", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "url_code",          limit: 255
    t.string   "background",        limit: 255
    t.string   "title",             limit: 255
    t.string   "file",              limit: 255
    t.string   "seo_desc",          limit: 255
    t.string   "keyword",           limit: 255
    t.string   "ad_code",           limit: 255
    t.integer  "topic_template_id", limit: 4
    t.integer  "domain_id",         limit: 4
    t.boolean  "enabled",                       default: true, null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "topics", ["domain_id"], name: "index_topics_on_domain_id", using: :btree
  add_index "topics", ["enabled"], name: "index_topics_on_enabled", using: :btree
  add_index "topics", ["name"], name: "index_topics_on_name", using: :btree

  create_table "user_control_scopes", force: :cascade do |t|
    t.integer  "user_permission_ship_id", limit: 4
    t.string   "resource_type",           limit: 255
    t.integer  "resource_id",             limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "user_control_scopes", ["resource_type", "resource_id"], name: "index_user_control_scopes_on_resource_type_and_resource_id", using: :btree
  add_index "user_control_scopes", ["user_permission_ship_id"], name: "index_user_control_scopes_on_user_id", using: :btree

  create_table "user_favorites", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.string   "resource_type", limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "content",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "user_friends", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "friend_id",  limit: 4
    t.text     "memo",       limit: 65535
    t.integer  "enabled",    limit: 1
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "user_gifts", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "required_bonus", limit: 4
    t.integer  "price_official", limit: 4
    t.integer  "gift_quantity",  limit: 4
    t.integer  "gift_limit",     limit: 4
    t.string   "url",            limit: 255
    t.text     "desc",           limit: 65535
    t.integer  "domain_id",      limit: 4
    t.integer  "status",         limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "user_images", force: :cascade do |t|
    t.string   "file",       limit: 255
    t.integer  "user_id",    limit: 4
    t.integer  "category",   limit: 4
    t.string   "url_thumb",  limit: 255
    t.string   "url_origin", limit: 255
    t.string   "url_large",  limit: 255
    t.string   "url_medium", limit: 255
    t.text     "url_small",  limit: 65535
    t.boolean  "enabled",                  default: true
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "user_images", ["user_id", "category"], name: "index_user_images_on_user_id_and_category", using: :btree

  create_table "user_messages", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.string   "content",      limit: 255
    t.integer  "from_user_id", limit: 4
    t.integer  "to_user_id",   limit: 4
    t.integer  "parent_id",    limit: 4
    t.boolean  "is_readed",                default: false
    t.integer  "chat_room_id", limit: 4
    t.boolean  "enabled",                  default: true
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "user_permission_ships", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "permission_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "user_permission_ships", ["permission_id"], name: "index_user_permission_ships_on_permission_id", using: :btree
  add_index "user_permission_ships", ["user_id"], name: "index_user_permission_ships_on_user_id", using: :btree

  create_table "user_profiles", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.string   "name",              limit: 255
    t.integer  "gender",            limit: 4
    t.integer  "city_id",           limit: 4
    t.integer  "district_id",       limit: 4
    t.text     "address",           limit: 65535
    t.string   "telphone",          limit: 255
    t.string   "cellphone",         limit: 255
    t.datetime "birthday"
    t.integer  "phone_status",      limit: 4
    t.integer  "send_count",        limit: 4
    t.datetime "send_time"
    t.integer  "verification_code", limit: 4
    t.integer  "income_id",         limit: 4
    t.integer  "education_id",      limit: 4
    t.integer  "career_id",         limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "user_profiles", ["career_id"], name: "index_user_profiles_on_career_id", using: :btree
  add_index "user_profiles", ["city_id"], name: "index_user_profiles_on_city_id", using: :btree
  add_index "user_profiles", ["district_id"], name: "index_user_profiles_on_district_id", using: :btree
  add_index "user_profiles", ["education_id"], name: "index_user_profiles_on_education_id", using: :btree
  add_index "user_profiles", ["income_id"], name: "index_user_profiles_on_income_id", using: :btree
  add_index "user_profiles", ["user_id"], name: "index_user_profiles_on_user_id", using: :btree

  create_table "user_settings", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.string   "resource_type",        limit: 255
    t.integer  "basic_role_mapper_id", limit: 4
    t.integer  "restriction",          limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "user_surveys", force: :cascade do |t|
    t.integer  "surveys_type", limit: 4
    t.string   "name",         limit: 255
    t.text     "sort",         limit: 65535
    t.boolean  "enabled"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "account",                limit: 255
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "nickname",               limit: 255
    t.integer  "status",                 limit: 4
    t.integer  "bonus",                  limit: 4,     default: 0
    t.integer  "role_id",                limit: 4
    t.integer  "exp",                    limit: 4,     default: 0
    t.integer  "posts",                  limit: 4,     default: 0
    t.string   "password_salt",          limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.text     "publish_stream_token",   limit: 65535
    t.string   "reset_password_token",   limit: 255
    t.string   "mobile_token",           limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "spree_api_key",          limit: 48
  end

  add_index "users", ["account"], name: "account", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_user_role_id", using: :btree
  add_index "users", ["spree_api_key"], name: "index_users_on_spree_api_key", using: :btree
  add_index "users", ["status"], name: "index_users_on_status", using: :btree

  create_table "vendor_protocol_ships", force: :cascade do |t|
    t.integer  "isp_vendor_id",   limit: 4
    t.integer  "isp_protocol_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "vendor_protocol_ships", ["isp_protocol_id"], name: "index_vendor_protocol_ships_on_isp_protocol_id", using: :btree
  add_index "vendor_protocol_ships", ["isp_vendor_id"], name: "index_vendor_protocol_ships_on_isp_vendor_id", using: :btree

  create_table "vote_details", force: :cascade do |t|
    t.string   "option_name",     limit: 255
    t.integer  "vote_id",         limit: 4
    t.boolean  "enabled"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "vote_logs_count", limit: 4,   default: 0
  end

  create_table "vote_logs", force: :cascade do |t|
    t.integer  "vote_detail_id", limit: 4
    t.integer  "user_id",        limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "votes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "article_id", limit: 4
    t.integer  "domain_id",  limit: 4
    t.boolean  "enabled"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "votes", ["domain_id"], name: "index_votes_on_domain_id", using: :btree

  add_foreign_key "position_block_resource_ships", "position_blocks"
end
