require 'test_helper'

module Maeku
  class EntryTest < ActiveSupport::TestCase

    setup do
      author_id = 1
      entry_content = "I saw spoiled fruit on the lawn."
      @entry = Entry.new(author_id: author_id)
      @entry.assign_attributes(entry_content_attributes: { content: entry_content })
    end

    test "should create new entry if entry and author_id exist" do
      assert @entry.save
    end

    test "should not create new entry if entry has no content" do
      @entry.entry_content = nil
      assert_not @entry.save
    end

    test "should not create new entry if author_id is nil" do
      @entry.author_id = nil
      assert_not @entry.save
    end

  end
end
