module Maeku
  class Types::QueryType < Types::BaseObject
  end
end

Maeku::Types::QueryType = GraphQL::ObjectType.define do

  name "Query"

  field :entries, !types[Types::EntryType] do
    argument :limit, types.Int, default_value: 20
    resolve -> (obj, args, ctx) {
      Entry.limit(args[:limit]).order(id: :desc)
    }
  end
end
