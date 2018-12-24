require 'test_helper'

module Maeku
  class QuerySchemaTest < ActiveSupport::TestCase

    setup do
      @author = User.find(1)
    end

    def execute_query(query_string, context={}, variables={})
      MaekuSchema.execute(query_string, context: context, variables: variables)
    end

    test "should return a list of all authors" do
      result = execute_query("{ allAuthors { id name } }")
      author_count = result['data']['allAuthors'].count
      assert_equal users.count, author_count
    end

    test "should return a list of entries by all authors" do
      result = execute_query("{ allAuthors { id entries { id content } } }")

      result_count = result['data']['allAuthors'].map do |author|
        [author['id'], author['entries'].count]
      end.to_h

      fixtures_count = users.map do |user|
        [user.id, user.entries.count]
      end.to_h

      assert_equal result_count, fixtures_count
    end

    test "should return the current author" do
      context = { current_author: @author }
      result = execute_query("{ currentAuthor { id } }", context)
      author_id = result['data']['currentAuthor']['id']
      assert_equal 1, author_id
    end

    test "should return all of the current author's entries" do
      context = { current_author: @author }
      result = execute_query("{ currentAuthorEntries { id content } }", context)
      result_count = result['data']['currentAuthorEntries'].count
      fixtures_count = @author.entries.count
      assert_equal result_count, fixtures_count
    end

  end
end
