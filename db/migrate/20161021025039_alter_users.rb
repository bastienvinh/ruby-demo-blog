class AlterUsers < ActiveRecord::Migration[5.0]
  
  def up
    rename_table("users", "admin_users")
    # Remark :  after can be ignored if the database doesn't support the feature 
    add_column("admin_users", "username", :string, :limit => 25, :after => "email")
    change_column("admin_users", "email", :string, :limit => 100)
    rename_column("admin_users", "password", "hash_password")
    puts "*** adding an index ***"
    add_index("admin_users", "username")
  end

  # do on the reverse order

  def down
    remove_index("admin_users", "username")
    rename_column("admin_users", "hash_password", "password")
    change_column("admin_users", "email", :string, :limit => 25, :default => '', :null => false)
    remove_column("admin_users", "username")
    rename_table("admin_users", "users")
  end

end
