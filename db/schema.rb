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

ActiveRecord::Schema.define(version: 20160211144204) do

  create_table "ilance_buynow_orders", primary_key: "orderid", force: true do |t|
    t.integer  "parentid",                                   default: 0
    t.integer  "project_id",                                 default: 0
    t.integer  "buyer_id",                                   default: 0
    t.integer  "owner_id",                                   default: 0
    t.integer  "invoiceid",                                  default: 0
    t.integer  "attachid",                                   default: 0
    t.integer  "qty",                                        default: 1
    t.float    "amount",                    limit: 53,       default: 0.0
    t.float    "salestax",                  limit: 53,       default: 0.0
    t.string   "salestaxstate",             limit: 250,      default: ""
    t.string   "salestaxrate",              limit: 10,       default: "0"
    t.integer  "salestaxshipping",                           default: 0
    t.float    "escrowfee",                 limit: 53,       default: 0.0
    t.float    "escrowfeebuyer",            limit: 53,       default: 0.0
    t.float    "fvf",                       limit: 53,       default: 0.0
    t.float    "fvfbuyer",                  limit: 53,       default: 0.0
    t.integer  "isescrowfeepaid",                            default: 0
    t.integer  "isescrowfeebuyerpaid",                       default: 0
    t.integer  "isfvfpaid",                                  default: 0
    t.integer  "isfvfbuyerpaid",                             default: 0
    t.integer  "escrowfeeinvoiceid",                         default: 0
    t.integer  "escrowfeebuyerinvoiceid",                    default: 0
    t.integer  "fvfinvoiceid",                               default: 0
    t.integer  "fvfbuyerinvoiceid",                          default: 0
    t.integer  "ship_required",                              default: 1
    t.text     "ship_location",             limit: 16777215
    t.datetime "orderdate"
    t.datetime "canceldate"
    t.datetime "arrivedate"
    t.datetime "paiddate"
    t.datetime "releasedate"
    t.integer  "winnermarkedaspaid",                         default: 0
    t.datetime "winnermarkedaspaiddate"
    t.text     "winnermarkedaspaidmethod",  limit: 16777215
    t.string   "buyerpaymethod",            limit: 250,      default: ""
    t.float    "buyershipcost",             limit: 53,       default: 0.0
    t.integer  "buyershipperid",                             default: 0
    t.integer  "sellermarkedasshipped",                      default: 0
    t.datetime "sellermarkedasshippeddate"
    t.string   "shiptracknumber",           limit: 250,      default: ""
    t.integer  "buyerfeedback",                              default: 0
    t.integer  "sellerfeedback",                             default: 0
    t.string   "status",                    limit: 17,       default: "paid"
  end

  add_index "ilance_buynow_orders", ["attachid"], name: "attachid", using: :btree
  add_index "ilance_buynow_orders", ["buyer_id"], name: "buyer_id", using: :btree
  add_index "ilance_buynow_orders", ["invoiceid"], name: "invoiceid", using: :btree
  add_index "ilance_buynow_orders", ["owner_id"], name: "owner_id", using: :btree
  add_index "ilance_buynow_orders", ["parentid"], name: "parentid", using: :btree
  add_index "ilance_buynow_orders", ["project_id"], name: "project_id", using: :btree
  add_index "ilance_buynow_orders", ["status"], name: "status", using: :btree

  create_table "ilance_categories", primary_key: "cid", force: true do |t|
    t.string "name", limit: 20
  end

  create_table "ilance_projects", force: true do |t|
    t.integer  "project_id",                               default: 0
    t.integer  "escrow_id",                                default: 0
    t.integer  "cid",                                      default: 0
    t.text     "description",             limit: 16777215
    t.string   "ishtml",                  limit: 1,        default: "0"
    t.text     "description_videourl",    limit: 16777215
    t.datetime "date_added"
    t.datetime "date_starts"
    t.datetime "date_end"
    t.integer  "gtc",                                      default: 0
    t.datetime "gtc_cancelled"
    t.integer  "user_id",                                  default: 0
    t.integer  "visible",                                  default: 0
    t.integer  "views",                                    default: 0
    t.string   "project_title",           limit: 250,      default: ""
    t.integer  "bids",                                     default: 0
    t.integer  "bidsdeclined",                             default: 0
    t.integer  "bidsretracted",                            default: 0
    t.integer  "bidsshortlisted",                          default: 0
    t.string   "budgetgroup",             limit: 30,       default: ""
    t.text     "additional_info",         limit: 16777215
    t.string   "status",                  limit: 17,       default: "draft"
    t.datetime "close_date"
    t.string   "transfertype",            limit: 6,        default: "userid"
    t.integer  "transfer_to_userid",                       default: 0
    t.integer  "transfer_from_userid",                     default: 0
    t.string   "transfer_to_email",       limit: 50,       default: ""
    t.string   "transfer_status",         limit: 8,        default: ""
    t.string   "transfer_code",           limit: 32,       default: ""
    t.string   "project_details",         limit: 11,       default: "public"
    t.string   "project_type",            limit: 7,        default: "reverse"
    t.string   "project_state",           limit: 7,        default: "service"
    t.string   "bid_details",             limit: 6,        default: "open"
    t.string   "filter_rating",           limit: 1,        default: "0"
    t.string   "filter_country",          limit: 1,        default: "0"
    t.string   "filter_state",            limit: 1,        default: "0"
    t.string   "filter_city",             limit: 1,        default: "0"
    t.string   "filter_zip",              limit: 1,        default: "0"
    t.string   "filter_underage",         limit: 1,        default: "0"
    t.string   "filter_businessnumber",   limit: 1,        default: "0"
    t.string   "filter_bidtype",          limit: 1,        default: "0"
    t.string   "filter_budget",           limit: 1,        default: "0"
    t.integer  "filter_escrow",                            default: 0
    t.integer  "filter_gateway",                           default: 0
    t.integer  "filter_ccgateway",                         default: 0
    t.integer  "filter_offline",                           default: 0
    t.string   "filter_publicboard",      limit: 1,        default: "0"
    t.string   "filtered_rating",         limit: 1,        default: "1"
    t.string   "filtered_country",        limit: 50,       default: ""
    t.string   "filtered_state",          limit: 50,       default: ""
    t.string   "filtered_city",           limit: 20,       default: ""
    t.string   "filtered_zip",            limit: 10,       default: ""
    t.integer  "filter_bidlimit",                          default: 0
    t.integer  "filtered_bidlimit",                        default: 10
    t.string   "filtered_bidtype",        limit: 7,        default: "entire"
    t.string   "filtered_bidtypecustom",  limit: 250,      default: ""
    t.integer  "filtered_budgetid",                        default: 0
    t.string   "filtered_auctiontype",    limit: 10,       default: "regular"
    t.string   "classified_phone",        limit: 32,       default: ""
    t.float    "classified_price",        limit: 53,       default: 0.0
    t.integer  "urgent",                                   default: 0
    t.integer  "buynow",                                   default: 0
    t.float    "buynow_price",            limit: 53,       default: 0.0
    t.integer  "buynow_qty",                               default: 0
    t.integer  "buynow_qty_lot",                           default: 0
    t.integer  "items_in_lot",            limit: 3,        default: 0
    t.integer  "buynow_purchases",                         default: 0
    t.integer  "reserve",                                  default: 0
    t.float    "reserve_price",           limit: 53,       default: 0.0
    t.integer  "featured",                                 default: 0
    t.datetime "featured_date"
    t.integer  "featured_searchresults",                   default: 0
    t.integer  "highlite",                                 default: 0
    t.integer  "bold",                                     default: 0
    t.integer  "autorelist",                               default: 0
    t.datetime "autorelist_date"
    t.float    "startprice",              limit: 53,       default: 0.0
    t.float    "retailprice",             limit: 53,       default: 0.0
    t.integer  "uniquebidcount",                           default: 0
    t.text     "paymethod",               limit: 16777215
    t.text     "paymethodcc",             limit: 16777215
    t.text     "paymethodoptions",        limit: 16777215
    t.text     "paymethodoptionsemail",   limit: 16777215
    t.string   "keywords",                limit: 250,      default: ""
    t.float    "currentprice",            limit: 53,       default: 0.0
    t.float    "insertionfee",            limit: 53,       default: 0.0
    t.float    "enhancementfee",          limit: 53,       default: 0.0
    t.float    "fvf",                     limit: 53,       default: 0.0
    t.integer  "isfvfpaid",                                default: 0
    t.integer  "isifpaid",                                 default: 0
    t.integer  "isenhancementfeepaid",                     default: 0
    t.integer  "ifinvoiceid",                              default: 0
    t.integer  "enhancementfeeinvoiceid",                  default: 0
    t.integer  "fvfinvoiceid",                             default: 0
    t.integer  "returnaccepted",                           default: 0
    t.string   "returnwithin",            limit: 2,        default: "0"
    t.string   "returngivenas",           limit: 9,        default: "none"
    t.string   "returnshippaidby",        limit: 6,        default: "none"
    t.text     "returnpolicy",            limit: 16777215
    t.integer  "buyerfeedback",                            default: 0
    t.integer  "sellerfeedback",                           default: 0
    t.integer  "hasimage",                                 default: 0
    t.integer  "hasimageslideshow",                        default: 0
    t.integer  "hasdigitalfile",                           default: 0
    t.integer  "haswinner",                                default: 0
    t.integer  "hasbuynowwinner",                          default: 0
    t.integer  "winner_user_id",                           default: 0
    t.integer  "donation",                                 default: 0
    t.integer  "charityid",                                default: 0
    t.integer  "donationpercentage",                       default: 0
    t.integer  "donermarkedaspaid",                        default: 0
    t.datetime "donermarkedaspaiddate"
    t.integer  "donationinvoiceid",                        default: 0
    t.integer  "currencyid",                               default: 0
    t.integer  "countryid",                                default: 0
    t.string   "country",                 limit: 250,      default: ""
    t.string   "state",                   limit: 250,      default: ""
    t.string   "city",                    limit: 250,      default: ""
    t.string   "zipcode",                 limit: 50,       default: ""
    t.string   "sku",                     limit: 250,      default: ""
    t.string   "upc",                     limit: 250,      default: ""
    t.string   "ean",                     limit: 250,      default: ""
    t.string   "isbn10",                  limit: 250,      default: ""
    t.string   "isbn13",                  limit: 250,      default: ""
    t.string   "partnumber",              limit: 250,      default: ""
    t.string   "modelnumber",             limit: 250,      default: ""
    t.string   "salestaxstate",           limit: 250,      default: ""
    t.string   "salestaxrate",            limit: 10,       default: "0"
    t.integer  "salestaxentirecountry",                    default: 0
    t.integer  "salestaxshipping",                         default: 0
    t.integer  "countdownresets",                          default: 0
    t.integer  "bulkid",                                   default: 0
    t.integer  "updateid",                                 default: 1
    t.integer  "storeid",                                  default: 0
    t.text     "itemcondition",           limit: 16777215
    t.text     "imageurl",                limit: 16777215
    t.integer  "imageurl_attachid",                        default: 0
    t.integer  "download_attachid",                        default: 0
    t.integer  "itemstatus",                               default: 1
    t.integer  "storecid",                                 default: 0
    t.string   "tags",                    limit: 100
    t.string   "genre",                   limit: 100
  end

  add_index "ilance_projects", ["charityid"], name: "charityid", using: :btree
  add_index "ilance_projects", ["cid"], name: "cid", using: :btree
  add_index "ilance_projects", ["countryid"], name: "countryid", using: :btree
  add_index "ilance_projects", ["hasdigitalfile"], name: "hasdigitalfile", using: :btree
  add_index "ilance_projects", ["hasimage"], name: "hasimage", using: :btree
  add_index "ilance_projects", ["hasimageslideshow"], name: "hasimageslideshow", using: :btree
  add_index "ilance_projects", ["isbn10"], name: "isbn10", using: :btree
  add_index "ilance_projects", ["isbn13"], name: "isbn13", using: :btree
  add_index "ilance_projects", ["modelnumber"], name: "modelnumber", using: :btree
  add_index "ilance_projects", ["partnumber"], name: "partnumber", using: :btree
  add_index "ilance_projects", ["project_details"], name: "project_details", using: :btree
  add_index "ilance_projects", ["project_id"], name: "ilance_project_id", using: :btree
  add_index "ilance_projects", ["project_state"], name: "project_state", using: :btree
  add_index "ilance_projects", ["project_title"], name: "project_title", using: :btree
  add_index "ilance_projects", ["project_type"], name: "project_type", using: :btree
  add_index "ilance_projects", ["sku"], name: "sku", using: :btree
  add_index "ilance_projects", ["status"], name: "ilance_status", using: :btree
  add_index "ilance_projects", ["zipcode"], name: "zipcode", using: :btree

  create_table "ilance_subscription_user", force: true do |t|
    t.integer  "subscriptionid",            default: 1
    t.integer  "user_id",                   default: -1
    t.string   "paymethod",      limit: 12, default: "account"
    t.datetime "startdate"
    t.datetime "renewdate"
    t.integer  "autopayment",               default: 1
    t.string   "autorenewal",    limit: 1,  default: "1"
    t.string   "active",         limit: 9,  default: "no"
    t.integer  "cancelled",                 default: 0
    t.integer  "migrateto",                 default: 0
    t.string   "migratelogic",   limit: 6,  default: "none"
    t.integer  "recurring",                 default: 0
    t.integer  "invoiceid",                 default: 0
    t.integer  "roleid",                    default: -1
  end

  add_index "ilance_subscription_user", ["active"], name: "active", using: :btree
  add_index "ilance_subscription_user", ["invoiceid"], name: "ilance_invoiceid", using: :btree
  add_index "ilance_subscription_user", ["migratelogic"], name: "migratelogic", using: :btree
  add_index "ilance_subscription_user", ["paymethod"], name: "paymethod", using: :btree
  add_index "ilance_subscription_user", ["subscriptionid"], name: "subscriptionid", using: :btree
  add_index "ilance_subscription_user", ["user_id"], name: "user_id", using: :btree

  create_table "ilance_users", primary_key: "user_id", force: true do |t|
    t.string   "ipaddress",            limit: 25,       default: ""
    t.integer  "iprestrict",                            default: 0
    t.string   "username",             limit: 50,       default: ""
    t.string   "password",             limit: 200,      default: ""
    t.string   "salt",                 limit: 200,      default: ""
    t.string   "secretquestion",       limit: 200,      default: ""
    t.string   "secretanswer",         limit: 32,       default: ""
    t.string   "email",                limit: 60,       default: ""
    t.string   "first_name",           limit: 100,      default: ""
    t.string   "last_name",            limit: 100,      default: ""
    t.string   "address",              limit: 200,      default: ""
    t.string   "address2",             limit: 200
    t.string   "city",                 limit: 100,      default: ""
    t.string   "state",                limit: 100,      default: ""
    t.string   "zip_code",             limit: 10,       default: ""
    t.string   "phone",                limit: 20,       default: ""
    t.integer  "country",                               default: 500
    t.datetime "date_added"
    t.text     "subcategories",        limit: 16777215
    t.string   "status",               limit: 10,       default: "active"
    t.integer  "serviceawards",                         default: 0
    t.integer  "productawards",                         default: 0
    t.integer  "servicesold",                           default: 0
    t.integer  "productsold",                           default: 0
    t.float    "rating",               limit: 53,       default: 0.0
    t.integer  "score",                                 default: 0
    t.float    "feedback",             limit: 53,       default: 0.0
    t.integer  "bidstoday",                             default: 0
    t.integer  "bidsthismonth",                         default: 0
    t.integer  "auctiondelists",                        default: 0
    t.integer  "bidretracts",                           default: 0
    t.datetime "lastseen"
    t.date     "dob"
    t.string   "rid",                  limit: 10,       default: ""
    t.string   "account_number",       limit: 25,       default: ""
    t.float    "available_balance",    limit: 53,       default: 0.0
    t.float    "total_balance",        limit: 53,       default: 0.0
    t.float    "income_reported",      limit: 53,       default: 0.0
    t.float    "income_spent",         limit: 53,       default: 0.0
    t.string   "startpage",            limit: 250,      default: "main"
    t.integer  "styleid"
    t.integer  "project_distance",                      default: 1
    t.integer  "currency_calculation",                  default: 1
    t.integer  "languageid"
    t.integer  "currencyid"
    t.string   "timezone",             limit: 250
    t.integer  "notifyservices"
    t.integer  "notifyproducts"
    t.text     "notifyservicescats",   limit: 16777215
    t.text     "notifyproductscats",   limit: 16777215
    t.date     "lastemailservicecats"
    t.date     "lastemailproductcats"
    t.integer  "displayprofile"
    t.integer  "emailnotify"
    t.integer  "displayfinancials"
    t.string   "vatnumber",            limit: 250
    t.string   "regnumber",            limit: 250
    t.string   "dnbnumber",            limit: 250
    t.string   "companyname",          limit: 100
    t.integer  "usecompanyname"
    t.integer  "timeonsite"
    t.integer  "daysonsite"
    t.integer  "isadmin",                               default: 0
    t.text     "permissions",          limit: 16777215
    t.text     "searchoptions",        limit: 16777215
    t.float    "rateperhour",          limit: 53,       default: 0.0
    t.text     "profilevideourl",      limit: 16777215
    t.text     "profileintro",         limit: 16777215
    t.string   "gender",               limit: 6,        default: ""
    t.string   "freelancing",          limit: 10,       default: ""
    t.integer  "autopayment",                           default: 1
    t.integer  "posthtml",                              default: 0
    t.text     "username_history",     limit: 16777215
    t.datetime "password_lastchanged"
    t.integer  "role",                                  default: 0
    t.integer  "store",                                 default: 0
    t.integer  "store_pay",                             default: 0
  end

  add_index "ilance_users", ["city"], name: "city", using: :btree
  add_index "ilance_users", ["country"], name: "country", using: :btree
  add_index "ilance_users", ["email"], name: "email", using: :btree
  add_index "ilance_users", ["first_name"], name: "first_name", using: :btree
  add_index "ilance_users", ["freelancing"], name: "freelancing", using: :btree
  add_index "ilance_users", ["gender"], name: "gender", using: :btree
  add_index "ilance_users", ["last_name"], name: "last_name", using: :btree
  add_index "ilance_users", ["rating"], name: "rating", using: :btree
  add_index "ilance_users", ["score"], name: "score", using: :btree
  add_index "ilance_users", ["serviceawards"], name: "serviceawards", using: :btree
  add_index "ilance_users", ["state"], name: "state", using: :btree
  add_index "ilance_users", ["status"], name: "ilance_users_status", using: :btree
  add_index "ilance_users", ["username"], name: "username", using: :btree
  add_index "ilance_users", ["zip_code"], name: "zip_code", using: :btree

end
