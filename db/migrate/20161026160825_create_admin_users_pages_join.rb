class CreateAdminUsersPagesJoin < ActiveRecord::Migration[5.0]
  def up
    create_table :admin_users_pages, :id => false do |new_table_definition|
      new_table_definition.integer "admin_user_id"
      new_table_definition.integer "page_id"
    end

    add_index("admin_users_pages", ["admin_user_id", "page_id"])
  end

  def down
    drop_table :admin_users_pages
  end
end
