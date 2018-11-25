require 'test_helper'

module Maeku
  class EntryContentTest < ActiveSupport::TestCase

    setup do
      entry = maeku_entries(:one)
      @entry_content = Maeku::EntryContent.new(content: "I closed my eyes.", entry_id: entry.id)
    end

    test "should save new entry content if entry id exists" do
      assert @entry_content.save
    end

    test "should not save new entry content without entry id" do
      @entry_content.entry_id = nil
      assert_not @entry_content.save
    end

    test "should save entry content if content is nil" do
      @entry_content.content = nil
      assert @entry_content.save
    end
  end
end
