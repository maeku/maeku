class AddTypeToMaekuEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :maeku_entries, :type, :string
    change_column :maeku_entries, :type, :string, null: true
  end
end
