module Maeku
  class Types::AuthorType < Types::BaseType
    description "Type for the application-provided #{Maeku.author_class.name} class."

    Maeku.author_class.columns.each do |column|
      ignored_column_types = [:date, :datetime, :time]

      unless ignored_column_types.include? column.type
        name, type = column.name.to_sym, const_get(column.type.to_s.capitalize)

        field name, type, null: true unless column.name =~ /password/

        define_method name do
          object.public_send(name)
        end
      end
    end

    field :entries, [Types::EntryType], null: true

    def entries
      Entry.where(author_id: id)
    end
  end
end
