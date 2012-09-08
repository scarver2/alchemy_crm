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

ActiveRecord::Schema.define(:version => 20120908145623) do

  create_table "alchemy_attachments", :force => true do |t|
    t.string   "name"
    t.string   "filename"
    t.string   "content_type"
    t.integer  "size"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alchemy_cells", :force => true do |t|
    t.integer  "page_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alchemy_contact_groups_newsletters", :id => false, :force => true do |t|
    t.integer "contact_group_id"
    t.integer "newsletter_id"
  end

  add_index "alchemy_contact_groups_newsletters", ["contact_group_id", "newsletter_id"], :name => "contact_group_newsletter_index", :unique => true

  create_table "alchemy_contents", :force => true do |t|
    t.string   "name"
    t.string   "essence_type"
    t.integer  "essence_id"
    t.integer  "element_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  add_index "alchemy_contents", ["element_id", "position"], :name => "index_contents_on_element_id_and_position"

  create_table "alchemy_crm_contact_group_filters", :force => true do |t|
    t.string   "column"
    t.string   "value"
    t.string   "operator"
    t.integer  "contact_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "alchemy_crm_contact_groups", :force => true do |t|
    t.string   "name"
    t.string   "string"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.text     "cached_contact_tag_list"
    t.integer  "contacts_count",          :default => 0
  end

  create_table "alchemy_crm_contacts", :force => true do |t|
    t.string   "title"
    t.string   "salutation"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone"
    t.string   "mobile"
    t.string   "address"
    t.string   "zip"
    t.string   "city"
    t.string   "country"
    t.string   "company"
    t.string   "email_sha1"
    t.string   "email_salt"
    t.boolean  "verified",        :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.text     "cached_tag_list"
    t.boolean  "disabled",        :default => false
  end

  add_index "alchemy_crm_contacts", ["email"], :name => "index_alchemy_crm_contacts_on_email"
  add_index "alchemy_crm_contacts", ["email_sha1"], :name => "index_alchemy_crm_contacts_on_email_sha1"
  add_index "alchemy_crm_contacts", ["verified", "disabled"], :name => "alchemy_crm_contacts_available_index"

  create_table "alchemy_crm_deliveries", :force => true do |t|
    t.string   "name"
    t.integer  "mailing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deliver_at"
    t.datetime "delivered_at"
    t.integer  "emails_sent",  :default => 0
  end

  create_table "alchemy_crm_mailings", :force => true do |t|
    t.string   "name"
    t.string   "subject"
    t.string   "salt"
    t.string   "sha1"
    t.integer  "page_id"
    t.text     "additional_email_addresses"
    t.integer  "newsletter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  add_index "alchemy_crm_mailings", ["sha1"], :name => "index_alchemy_crm_mailings_on_sha1"

  create_table "alchemy_crm_newsletters", :force => true do |t|
    t.string   "name"
    t.string   "layout"
    t.boolean  "public",                            :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "subscriptions_count",               :default => 0
    t.integer  "user_subscriptions_count",          :default => 0
    t.integer  "contact_group_subscriptions_count", :default => 0
  end

  create_table "alchemy_crm_reactions", :force => true do |t|
    t.integer  "recipient_id"
    t.integer  "page_id"
    t.integer  "element_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "url"
  end

  add_index "alchemy_crm_reactions", ["recipient_id"], :name => "index_alchemy_crm_reactions_on_recipient_id"

  create_table "alchemy_crm_recipients", :force => true do |t|
    t.string   "email"
    t.boolean  "bounced",     :default => false
    t.boolean  "read",        :default => false
    t.boolean  "reacted",     :default => false
    t.integer  "delivery_id"
    t.integer  "contact_id"
    t.string   "message_id"
    t.datetime "read_at"
    t.datetime "bounced_at"
    t.datetime "reacted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sha1"
    t.string   "salt"
  end

  add_index "alchemy_crm_recipients", ["contact_id"], :name => "index_alchemy_crm_recipients_on_contact_id"
  add_index "alchemy_crm_recipients", ["delivery_id"], :name => "index_alchemy_crm_recipients_on_delivery_id"
  add_index "alchemy_crm_recipients", ["email"], :name => "index_alchemy_crm_recipients_on_email"
  add_index "alchemy_crm_recipients", ["message_id"], :name => "index_alchemy_crm_recipients_on_message_id"
  add_index "alchemy_crm_recipients", ["sha1"], :name => "index_alchemy_crm_recipients_on_sha1"

  create_table "alchemy_crm_subscriptions", :force => true do |t|
    t.integer "contact_id"
    t.integer "newsletter_id"
    t.boolean "wants",            :default => true
    t.integer "contact_group_id"
  end

  add_index "alchemy_crm_subscriptions", ["contact_id", "newsletter_id"], :name => "contact_newsletter_index", :unique => true

  create_table "alchemy_elements", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.integer  "page_id"
    t.boolean  "public",     :default => true
    t.boolean  "folded",     :default => false
    t.boolean  "unique",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "cell_id"
  end

  add_index "alchemy_elements", ["page_id", "position"], :name => "index_elements_on_page_id_and_position"

  create_table "alchemy_elements_alchemy_pages", :id => false, :force => true do |t|
    t.integer "element_id"
    t.integer "page_id"
  end

  create_table "alchemy_essence_audios", :force => true do |t|
    t.integer  "attachment_id"
    t.integer  "width",           :default => 400
    t.integer  "height",          :default => 300
    t.boolean  "show_eq",         :default => true
    t.boolean  "show_navigation", :default => true
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alchemy_essence_dates", :force => true do |t|
    t.datetime "date"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alchemy_essence_element_teasers", :force => true do |t|
    t.string   "url"
    t.string   "title"
    t.string   "text"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alchemy_essence_files", :force => true do |t|
    t.integer  "attachment_id"
    t.string   "title"
    t.string   "css_class"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alchemy_essence_flashes", :force => true do |t|
    t.integer  "attachment_id"
    t.integer  "width",          :default => 400
    t.integer  "height",         :default => 300
    t.string   "player_version", :default => "9.0.28"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alchemy_essence_htmls", :force => true do |t|
    t.text     "source"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alchemy_essence_pictures", :force => true do |t|
    t.integer  "picture_id"
    t.string   "caption"
    t.string   "title"
    t.string   "alt_tag"
    t.string   "link"
    t.string   "link_class_name"
    t.string   "link_title"
    t.string   "css_class"
    t.string   "link_target"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "crop_from"
    t.string   "crop_size"
    t.string   "render_size"
  end

  create_table "alchemy_essence_richtexts", :force => true do |t|
    t.text     "body"
    t.text     "stripped_body"
    t.boolean  "do_not_index",  :default => false
    t.boolean  "public"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alchemy_essence_texts", :force => true do |t|
    t.text     "body"
    t.string   "link"
    t.string   "link_title"
    t.string   "link_class_name"
    t.boolean  "public",          :default => false
    t.boolean  "do_not_index",    :default => false
    t.string   "link_target"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alchemy_essence_videos", :force => true do |t|
    t.integer  "attachment_id"
    t.integer  "width"
    t.integer  "height"
    t.boolean  "allow_fullscreen", :default => true
    t.boolean  "auto_play",        :default => false
    t.boolean  "show_navigation",  :default => true
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alchemy_folded_pages", :force => true do |t|
    t.integer "page_id"
    t.integer "user_id"
    t.boolean "folded",  :default => false
  end

  create_table "alchemy_languages", :force => true do |t|
    t.string   "name"
    t.string   "language_code"
    t.string   "frontpage_name"
    t.string   "page_layout",    :default => "intro"
    t.boolean  "public",         :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.boolean  "default",        :default => false
    t.string   "country_code"
  end

  add_index "alchemy_languages", ["language_code", "country_code"], :name => "index_alchemy_languages_on_language_code_and_country_code"
  add_index "alchemy_languages", ["language_code"], :name => "index_alchemy_languages_on_language_code"

  create_table "alchemy_pages", :force => true do |t|
    t.string   "name"
    t.string   "urlname"
    t.string   "title"
    t.string   "language_code"
    t.boolean  "language_root",    :limit => 255
    t.string   "page_layout"
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "parent_id"
    t.integer  "depth"
    t.boolean  "visible",                         :default => false
    t.boolean  "public",                          :default => false
    t.boolean  "locked",                          :default => false
    t.integer  "locked_by"
    t.boolean  "restricted",                      :default => false
    t.boolean  "robot_index",                     :default => true
    t.boolean  "robot_follow",                    :default => true
    t.boolean  "sitemap",                         :default => true
    t.boolean  "layoutpage",                      :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "language_id"
  end

  add_index "alchemy_pages", ["language_id"], :name => "index_pages_on_language_id"
  add_index "alchemy_pages", ["parent_id", "lft"], :name => "index_pages_on_parent_id_and_lft"
  add_index "alchemy_pages", ["urlname"], :name => "index_pages_on_urlname"

  create_table "alchemy_pictures", :force => true do |t|
    t.string   "name"
    t.string   "image_filename"
    t.integer  "image_width"
    t.integer  "image_height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "alchemy_users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "login"
    t.string   "email"
    t.string   "gender"
    t.string   "role",                               :default => "registered"
    t.string   "language"
    t.string   "crypted_password",    :limit => 128, :default => "",           :null => false
    t.string   "password_salt",       :limit => 128, :default => "",           :null => false
    t.integer  "login_count",                        :default => 0,            :null => false
    t.integer  "failed_login_count",                 :default => 0,            :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "persistence_token",                                            :null => false
    t.string   "single_access_token",                                          :null => false
    t.string   "perishable_token",                                             :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  add_index "alchemy_users", ["perishable_token"], :name => "index_users_on_perishable_token"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "queue"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

end
