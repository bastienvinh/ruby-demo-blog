class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |table_definition|
      # We don't need 

      table_definition.column "first_name", :string
      table_definition.string "last_name"
      table_definition.string "email", :default => '', :null => false
      table_definition.string "password", :limit => 40

      table_definition.timestamps
      # t.datetime "created_at"
      # t.datetime "update_at"
    end
  end
end
