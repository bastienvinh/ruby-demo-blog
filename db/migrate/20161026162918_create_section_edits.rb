class CreateSectionEdits < ActiveRecord::Migration[5.0]
  def up
    create_table :section_edits do |new_table_definition|
      new_table_definition.integer "admin_user_id"
      new_table_definition.integer "section_id"
      new_table_definition.string "summary"
      new_table_definition.timestamps
    end
    add_index("section_edits", ["admin_user_id", "section_id"])
  end

  def down
    drop_table :section_edits
  end
end
