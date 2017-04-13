class ChangeDbSchemas < ActiveRecord::Migration
  def change
  	change_column :ilance_users, :salt, :string, :limit => 200
  	change_column :ilance_users, :password, :string, :limit => 200
  end
end
