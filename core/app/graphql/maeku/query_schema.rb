module Maeku
  class QuerySchema < ::GraphQL::Schema::Object
    graphql_name "Query"
    description "The query root for this API."

    field :all_entries, [Types::EntryType], null: true do
      description "Returns information about entries."
      argument :limit, Int, default_value: 30, required: false
    end

    field :my_entries, [Types::EntryType], null: true do
      description "Returns entries posted by the current author."
      argument :limit, Int, default_value: 30, required: false
    end

    def all_entries(args)
      Entry.limit(args[:limit]).order(updated_at: :desc)
    end

    def my_entries(args)
      Entry.entries_for(context[:current_author]).limit(args[:limit]).order(updated_at: :desc)
    end
  end
end

