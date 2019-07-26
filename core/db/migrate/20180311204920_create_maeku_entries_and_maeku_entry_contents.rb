class CreateMaekuEntriesAndMaekuEntryContents < ActiveRecord::Migration[5.1]
  def change
    create_table :maeku_entries

    add_column :maeku_entries, :author_id, :integer
    change_column :maeku_entries, :author_id, :integer, null: false

    add_column :maeku_entries, :created_at, :datetime
    change_column :maeku_entries, :created_at, :datetime, null: false

    add_column :maeku_entries, :updated_at, :datetime
    change_column :maeku_entries, :updated_at, :datetime, null: false

    create_table :maeku_entry_contents

    add_column :maeku_entry_contents, :title, :text
    add_column :maeku_entry_contents, :content, :text

    add_column :maeku_entry_contents, :entry_id, :integer
    change_column :maeku_entry_contents, :entry_id, :integer, null: false
  end
end
