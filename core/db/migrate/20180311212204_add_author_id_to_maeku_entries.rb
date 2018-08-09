class AddAuthorIdToMaekuEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :maeku_entries, :author_id, :integer
    change_column :maeku_entries, :author_id, :integer, null: false
  end
end
