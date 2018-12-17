require 'graphql'
require_relative 'query_schema'
require_relative 'mutation_schema'

module Maeku
  class MaekuSchema < ::GraphQL::Schema
    query QuerySchema
    mutation MutationSchema
  end
end
