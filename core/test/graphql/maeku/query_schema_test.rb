require 'test_helper'

module Maeku
  class QuerySchemaTest < ActiveSupport::TestCase

    setup do
      @author = authors(:bashō)
    end

    def execute_query(query_string, context={}, variables={})
      Timeout::timeout(3) do
        MaekuSchema.execute(query_string, context: context, variables: variables)
      end
    end

    test "should return a list of all authors" do
      result = execute_query("{ allAuthors { id name } }")
      author_count = result['data']['allAuthors'].count
      assert_equal authors.count, author_count
    end

    test "should return a list of entries by all authors" do
      result = execute_query("{ allAuthors { id entries { id } } }")

      result_count = result['data']['allAuthors'].map do |author|
        [author['id'], author['entries'].count]
      end.to_h

      fixtures_count = authors.map do |user|
        [user.id, user.entries.count]
      end.to_h

      assert_equal result_count, fixtures_count
    end

    test "should return the current author" do
      context = { current_author: @author }
      result = execute_query("{ currentAuthor { id } }", context)
      author_id = result['data']['currentAuthor']['id']
      assert_equal @author.id , author_id
    end

    test "should return all of the current author's entries" do
      context = { current_author: @author }
      result = execute_query("{ currentAuthorEntries { id } }", context)
      result_count = result['data']['currentAuthorEntries'].count
      fixtures_count = @author.entries.count
      assert_equal result_count, fixtures_count
    end

  end
end
