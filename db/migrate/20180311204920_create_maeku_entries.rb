class CreateMaekuEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :maeku_entries do |t|
      t.text :entry

      t.timestamps
    end
  end
end
