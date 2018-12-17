module Maeku
  class QuerySchema < ::GraphQL::Schema::Object
    graphql_name "Query"
    description "The query root for this API."

    field :entries, [Types::EntryType], null: true do
      description "Returns information about entries."
      argument :limit, Int, default_value: 30, required: false
    end
    
    def entries(args) 
      Entry.limit(args[:limit]).order(updated_at: :desc)
    end
  end
end

