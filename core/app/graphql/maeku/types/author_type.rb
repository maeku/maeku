module Maeku
  class Types::AuthorType < Types::BaseType
    description "Type for the application-provided #{Maeku.author_class.name} class."

    Maeku.author_class.columns.each do |column|
      ignored_column_types = [:date, :datetime, :time]
      unless ignored_column_types.include? column.type
        type = const_get(column.type.to_s.capitalize)
        field column.name.to_sym, type, null: true if column.name !~ /password/
      end
    end

    field :entries, [Types::EntryType], null: true

    def entries
      Entry.where(author_id: id)
    end
  end
end
