class CreateDatabaseStructure < ActiveRecord::Migration
  def up
   create_table "ilance_buynow_orders", primary_key: "orderid", force: true do |t|
    t.integer  "parentid",                                   default: 0,      null: true
    t.integer  "project_id",                                 default: 0,      null: true
    t.integer  "buyer_id",                                   default: 0,      null: true
    t.integer  "owner_id",                                   default: 0,      null: true
    t.integer  "invoiceid",                                  default: 0,      null: true
    t.integer  "attachid",                                   default: 0,      null: true
    t.integer  "qty",                                        default: 1,      null: true
    t.float    "amount",                    limit: 53,       default: 0.0,    null: true
    t.float    "salestax",                  limit: 53,       default: 0.0,    null: true
    t.string   "salestaxstate",             limit: 250,      default: "",     null: true
    t.string   "salestaxrate",              limit: 10,       default: "0",    null: true
    t.integer  "salestaxshipping",                           default: 0,      null: true
    t.float    "escrowfee",                 limit: 53,       default: 0.0,    null: true
    t.float    "escrowfeebuyer",            limit: 53,       default: 0.0,    null: true
    t.float    "fvf",                       limit: 53,       default: 0.0,    null: true
    t.float    "fvfbuyer",                  limit: 53,       default: 0.0,    null: true
    t.integer  "isescrowfeepaid",                            default: 0,      null: true
    t.integer  "isescrowfeebuyerpaid",                       default: 0,      null: true
    t.integer  "isfvfpaid",                                  default: 0,      null: true
    t.integer  "isfvfbuyerpaid",                             default: 0,      null: true
    t.integer  "escrowfeeinvoiceid",                         default: 0,      null: true
    t.integer  "escrowfeebuyerinvoiceid",                    default: 0,      null: true
    t.integer  "fvfinvoiceid",                               default: 0,      null: true
    t.integer  "fvfbuyerinvoiceid",                          default: 0,      null: true
    t.integer  "ship_required",                              default: 1,      null: true
    t.text     "ship_location",             limit: 16777215
    t.datetime "orderdate",                                                   null: true
    t.datetime "canceldate",                                                  null: true
    t.datetime "arrivedate",                                                  null: true
    t.datetime "paiddate",                                                    null: true
    t.datetime "releasedate",                                                 null: true
    t.integer  "winnermarkedaspaid",                         default: 0,      null: true
    t.datetime "winnermarkedaspaiddate",                                      null: true
    t.text     "winnermarkedaspaidmethod",  limit: 16777215
    t.string   "buyerpaymethod",            limit: 250,      default: "",     null: true
    t.float    "buyershipcost",             limit: 53,       default: 0.0,    null: true
    t.integer  "buyershipperid",                             default: 0,      null: true
    t.integer  "sellermarkedasshipped",                      default: 0,      null: true
    t.datetime "sellermarkedasshippeddate",                                   null: true
    t.string   "shiptracknumber",           limit: 250,      default: "",     null: true
    t.integer  "buyerfeedback",                              default: 0,      null: true
    t.integer  "sellerfeedback",                             default: 0,      null: true
    t.string   "status",                    limit: 17,       default: "paid", null: true
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
    t.integer  "project_id",                               default: 0,         null: true
    t.integer  "escrow_id",                                default: 0,         null: true
    t.integer  "cid",                                      default: 0,         null: true
    t.text     "description",             limit: 16777215
    t.string   "ishtml",                  limit: 1,        default: "0",       null: true
    t.text     "description_videourl",    limit: 16777215
    t.datetime "date_added",                                                   null: true
    t.datetime "date_starts",                                                  null: true
    t.datetime "date_end",                                                     null: true
    t.integer  "gtc",                                      default: 0,         null: true
    t.datetime "gtc_cancelled",                                                null: true
    t.integer  "user_id",                                  default: 0,         null: true
    t.integer  "visible",                                  default: 0,         null: true
    t.integer  "views",                                    default: 0,         null: true
    t.string   "project_title",           limit: 250,      default: "",        null: true
    t.integer  "bids",                                     default: 0,         null: true
    t.integer  "bidsdeclined",                             default: 0,         null: true
    t.integer  "bidsretracted",                            default: 0,         null: true
    t.integer  "bidsshortlisted",                          default: 0,         null: true
    t.string   "budgetgroup",             limit: 30,       default: "",        null: true
    t.text     "additional_info",         limit: 16777215
    t.string   "status",                  limit: 17,       default: "draft",   null: true
    t.datetime "close_date",                                                   null: true
    t.string   "transfertype",            limit: 6,        default: "userid",  null: true
    t.integer  "transfer_to_userid",                       default: 0,         null: true
    t.integer  "transfer_from_userid",                     default: 0,         null: true
    t.string   "transfer_to_email",       limit: 50,       default: "",        null: true
    t.string   "transfer_status",         limit: 8,        default: "",        null: true
    t.string   "transfer_code",           limit: 32,       default: "",        null: true
    t.string   "project_details",         limit: 11,       default: "public",  null: true
    t.string   "project_type",            limit: 7,        default: "reverse", null: true
    t.string   "project_state",           limit: 7,        default: "service", null: true
    t.string   "bid_details",             limit: 6,        default: "open",    null: true
    t.string   "filter_rating",           limit: 1,        default: "0",       null: true
    t.string   "filter_country",          limit: 1,        default: "0",       null: true
    t.string   "filter_state",            limit: 1,        default: "0",       null: true
    t.string   "filter_city",             limit: 1,        default: "0",       null: true
    t.string   "filter_zip",              limit: 1,        default: "0",       null: true
    t.string   "filter_underage",         limit: 1,        default: "0",       null: true
    t.string   "filter_businessnumber",   limit: 1,        default: "0",       null: true
    t.string   "filter_bidtype",          limit: 1,        default: "0",       null: true
    t.string   "filter_budget",           limit: 1,        default: "0",       null: true
    t.integer  "filter_escrow",                            default: 0,         null: true
    t.integer  "filter_gateway",                           default: 0,         null: true
    t.integer  "filter_ccgateway",                         default: 0,         null: true
    t.integer  "filter_offline",                           default: 0,         null: true
    t.string   "filter_publicboard",      limit: 1,        default: "0",       null: true
    t.string   "filtered_rating",         limit: 1,        default: "1",       null: true
    t.string   "filtered_country",        limit: 50,       default: "",        null: true
    t.string   "filtered_state",          limit: 50,       default: "",        null: true
    t.string   "filtered_city",           limit: 20,       default: "",        null: true
    t.string   "filtered_zip",            limit: 10,       default: "",        null: true
    t.integer  "filter_bidlimit",                          default: 0,         null: true
    t.integer  "filtered_bidlimit",                        default: 10,        null: true
    t.string   "filtered_bidtype",        limit: 7,        default: "entire",  null: true
    t.string   "filtered_bidtypecustom",  limit: 250,      default: "",        null: true
    t.integer  "filtered_budgetid",                        default: 0,         null: true
    t.string   "filtered_auctiontype",    limit: 10,       default: "regular", null: true
    t.string   "classified_phone",        limit: 32,       default: "",        null: true
    t.float    "classified_price",        limit: 53,       default: 0.0,       null: true
    t.integer  "urgent",                                   default: 0,         null: true
    t.integer  "buynow",                                   default: 0,         null: true
    t.float    "buynow_price",            limit: 53,       default: 0.0,       null: true
    t.integer  "buynow_qty",                               default: 0,         null: true
    t.integer  "buynow_qty_lot",                           default: 0,         null: true
    t.integer  "items_in_lot",            limit: 3,        default: 0,         null: true
    t.integer  "buynow_purchases",                         default: 0,         null: true
    t.integer  "reserve",                                  default: 0,         null: true
    t.float    "reserve_price",           limit: 53,       default: 0.0,       null: true
    t.integer  "featured",                                 default: 0,         null: true
    t.datetime "featured_date",                                                null: true
    t.integer  "featured_searchresults",                   default: 0,         null: true
    t.integer  "highlite",                                 default: 0,         null: true
    t.integer  "bold",                                     default: 0,         null: true
    t.integer  "autorelist",                               default: 0,         null: true
    t.datetime "autorelist_date",                                              null: true
    t.float    "startprice",              limit: 53,       default: 0.0,       null: true
    t.float    "retailprice",             limit: 53,       default: 0.0,       null: true
    t.integer  "uniquebidcount",                           default: 0,         null: true
    t.text     "paymethod",               limit: 16777215
    t.text     "paymethodcc",             limit: 16777215
    t.text     "paymethodoptions",        limit: 16777215
    t.text     "paymethodoptionsemail",   limit: 16777215
    t.string   "keywords",                limit: 250,      default: "",        null: true
    t.float    "currentprice",            limit: 53,       default: 0.0,       null: true
    t.float    "insertionfee",            limit: 53,       default: 0.0,       null: true
    t.float    "enhancementfee",          limit: 53,       default: 0.0,       null: true
    t.float    "fvf",                     limit: 53,       default: 0.0,       null: true
    t.integer  "isfvfpaid",                                default: 0,         null: true
    t.integer  "isifpaid",                                 default: 0,         null: true
    t.integer  "isenhancementfeepaid",                     default: 0,         null: true
    t.integer  "ifinvoiceid",                              default: 0,         null: true
    t.integer  "enhancementfeeinvoiceid",                  default: 0,         null: true
    t.integer  "fvfinvoiceid",                             default: 0,         null: true
    t.integer  "returnaccepted",                           default: 0,         null: true
    t.string   "returnwithin",            limit: 2,        default: "0",       null: true
    t.string   "returngivenas",           limit: 9,        default: "none",    null: true
    t.string   "returnshippaidby",        limit: 6,        default: "none",    null: true
    t.text     "returnpolicy",            limit: 16777215
    t.integer  "buyerfeedback",                            default: 0,         null: true
    t.integer  "sellerfeedback",                           default: 0,         null: true
    t.integer  "hasimage",                                 default: 0,         null: true
    t.integer  "hasimageslideshow",                        default: 0,         null: true
    t.integer  "hasdigitalfile",                           default: 0,         null: true
    t.integer  "haswinner",                                default: 0,         null: true
    t.integer  "hasbuynowwinner",                          default: 0,         null: true
    t.integer  "winner_user_id",                           default: 0,         null: true
    t.integer  "donation",                                 default: 0,         null: true
    t.integer  "charityid",                                default: 0,         null: true
    t.integer  "donationpercentage",                       default: 0,         null: true
    t.integer  "donermarkedaspaid",                        default: 0,         null: true
    t.datetime "donermarkedaspaiddate",                                        null: true
    t.integer  "donationinvoiceid",                        default: 0,         null: true
    t.integer  "currencyid",                               default: 0,         null: true
    t.integer  "countryid",                                default: 0,         null: true
    t.string   "country",                 limit: 250,      default: "",        null: true
    t.string   "state",                   limit: 250,      default: "",        null: true
    t.string   "city",                    limit: 250,      default: "",        null: true
    t.string   "zipcode",                 limit: 50,       default: "",        null: true
    t.string   "sku",                     limit: 250,      default: "",        null: true
    t.string   "upc",                     limit: 250,      default: "",        null: true
    t.string   "ean",                     limit: 250,      default: "",        null: true
    t.string   "isbn10",                  limit: 250,      default: "",        null: true
    t.string   "isbn13",                  limit: 250,      default: "",        null: true
    t.string   "partnumber",              limit: 250,      default: "",        null: true
    t.string   "modelnumber",             limit: 250,      default: "",        null: true
    t.string   "salestaxstate",           limit: 250,      default: "",        null: true
    t.string   "salestaxrate",            limit: 10,       default: "0",       null: true
    t.integer  "salestaxentirecountry",                    default: 0,         null: true
    t.integer  "salestaxshipping",                         default: 0,         null: true
    t.integer  "countdownresets",                          default: 0,         null: true
    t.integer  "bulkid",                                   default: 0,         null: true
    t.integer  "updateid",                                 default: 1,         null: true
    t.integer  "storeid",                                  default: 0,         null: true
    t.text     "itemcondition",           limit: 16777215
    t.text     "imageurl",                limit: 16777215
    t.integer  "imageurl_attachid",                        default: 0,         null: true
    t.integer  "download_attachid",                        default: 0,         null: true
    t.integer  "itemstatus",                               default: 1,         null: true
    t.integer  "storecid",                                 default: 0,         null: true
    t.string   "tags",                    limit: 100,                          null: true
    t.string   "genre",                   limit: 100,                          null: true
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
    t.integer  "subscriptionid",            default: 1,         null: true
    t.integer  "user_id",                   default: -1,        null: true
    t.string   "paymethod",      limit: 12, default: "account", null: true
    t.datetime "startdate",                                     null: true
    t.datetime "renewdate",                                     null: true
    t.integer  "autopayment",               default: 1,         null: true
    t.string   "autorenewal",    limit: 1,  default: "1",       null: true
    t.string   "active",         limit: 9,  default: "no",      null: true
    t.integer  "cancelled",                 default: 0,         null: true
    t.integer  "migrateto",                 default: 0,         null: true
    t.string   "migratelogic",   limit: 6,  default: "none",    null: true
    t.integer  "recurring",                 default: 0,         null: true
    t.integer  "invoiceid",                 default: 0,         null: true
    t.integer  "roleid",                    default: -1,        null: true
  end

  add_index "ilance_subscription_user", ["active"], name: "active", using: :btree
  add_index "ilance_subscription_user", ["invoiceid"], name: "ilance_invoiceid", using: :btree
  add_index "ilance_subscription_user", ["migratelogic"], name: "migratelogic", using: :btree
  add_index "ilance_subscription_user", ["paymethod"], name: "paymethod", using: :btree
  add_index "ilance_subscription_user", ["subscriptionid"], name: "subscriptionid", using: :btree
  add_index "ilance_subscription_user", ["user_id"], name: "user_id", using: :btree

  create_table "ilance_users", primary_key: "user_id", force: true do |t|
    t.string   "ipaddress",            limit: 25,       default: "",       null: true
    t.integer  "iprestrict",                            default: 0,        null: true
    t.string   "username",             limit: 50,       default: "",       null: true
    t.string   "password",             limit: 32,       default: "",       null: true
    t.string   "salt",                 limit: 5,        default: "",       null: true
    t.string   "secretquestion",       limit: 200,      default: "",       null: true
    t.string   "secretanswer",         limit: 32,       default: "",       null: true
    t.string   "email",                limit: 60,       default: "",       null: true
    t.string   "first_name",           limit: 100,      default: "",       null: true
    t.string   "last_name",            limit: 100,      default: "",       null: true
    t.string   "address",              limit: 200,      default: "",       null: true
    t.string   "address2",             limit: 200
    t.string   "city",                 limit: 100,      default: "",       null: true
    t.string   "state",                limit: 100,      default: "",       null: true
    t.string   "zip_code",             limit: 10,       default: "",       null: true
    t.string   "phone",                limit: 20,       default: "",       null: true
    t.integer  "country",                               default: 500,      null: true
    t.datetime "date_added",                                               null: true
    t.text     "subcategories",        limit: 16777215
    t.string   "status",               limit: 10,       default: "active", null: true
    t.integer  "serviceawards",                         default: 0,        null: true
    t.integer  "productawards",                         default: 0,        null: true
    t.integer  "servicesold",                           default: 0,        null: true
    t.integer  "productsold",                           default: 0,        null: true
    t.float    "rating",               limit: 53,       default: 0.0,      null: true
    t.integer  "score",                                 default: 0,        null: true
    t.float    "feedback",             limit: 53,       default: 0.0,      null: true
    t.integer  "bidstoday",                             default: 0,        null: true
    t.integer  "bidsthismonth",                         default: 0,        null: true
    t.integer  "auctiondelists",                        default: 0,        null: true
    t.integer  "bidretracts",                           default: 0,        null: true
    t.datetime "lastseen",                                                 null: true
    t.date     "dob",                                                      null: true
    t.string   "rid",                  limit: 10,       default: "",       null: true
    t.string   "account_number",       limit: 25,       default: "",       null: true
    t.float    "available_balance",    limit: 53,       default: 0.0,      null: true
    t.float    "total_balance",        limit: 53,       default: 0.0,      null: true
    t.float    "income_reported",      limit: 53,       default: 0.0,      null: true
    t.float    "income_spent",         limit: 53,       default: 0.0,      null: true
    t.string   "startpage",            limit: 250,      default: "main",   null: true
    t.integer  "styleid",                                                  null: true
    t.integer  "project_distance",                      default: 1,        null: true
    t.integer  "currency_calculation",                  default: 1,        null: true
    t.integer  "languageid",                                               null: true
    t.integer  "currencyid",                                               null: true
    t.string   "timezone",             limit: 250,                         null: true
    t.integer  "notifyservices",                                           null: true
    t.integer  "notifyproducts",                                           null: true
    t.text     "notifyservicescats",   limit: 16777215
    t.text     "notifyproductscats",   limit: 16777215
    t.date     "lastemailservicecats",                                     null: true
    t.date     "lastemailproductcats",                                     null: true
    t.integer  "displayprofile",                                           null: true
    t.integer  "emailnotify",                                              null: true
    t.integer  "displayfinancials",                                        null: true
    t.string   "vatnumber",            limit: 250,                         null: true
    t.string   "regnumber",            limit: 250,                         null: true
    t.string   "dnbnumber",            limit: 250,                         null: true
    t.string   "companyname",          limit: 100,                         null: true
    t.integer  "usecompanyname",                                           null: true
    t.integer  "timeonsite",                                               null: true
    t.integer  "daysonsite",                                               null: true
    t.integer  "isadmin",                               default: 0,        null: true
    t.text     "permissions",          limit: 16777215
    t.text     "searchoptions",        limit: 16777215
    t.float    "rateperhour",          limit: 53,       default: 0.0,      null: true
    t.text     "profilevideourl",      limit: 16777215
    t.text     "profileintro",         limit: 16777215
    t.string   "gender",               limit: 6,        default: "",       null: true
    t.string   "freelancing",          limit: 10,       default: "",       null: true
    t.integer  "autopayment",                           default: 1,        null: true
    t.integer  "posthtml",                              default: 0,        null: true
    t.text     "username_history",     limit: 16777215
    t.datetime "password_lastchanged",                                     null: true
    t.integer  "role",                                  default: 0,        null: true
    t.integer  "store",                                 default: 0,        null: true
    t.integer  "store_pay",                             default: 0,        null: true
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
  end

