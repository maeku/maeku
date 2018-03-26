class AddAuthorIdToJournalEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :journal_entries, :author_id, :integer
  end
end
