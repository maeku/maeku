require 'graphql'

module Maeku
  class MaekuSchema < ::GraphQL::Schema
    # mutation(Types::MutationType)
    query(Types::QueryType)
  end
end
