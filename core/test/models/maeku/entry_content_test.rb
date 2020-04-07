require 'test_helper'

module Maeku
  class EntryContentTest < ActiveSupport::TestCase

    setup do
      @entry_content = maeku_entries(:simple).entry_content
    end

    test "should save new entry content if entry id exists" do
      assert @entry_content.save
    end

    test "should not save new entry content without entry id" do
      @entry_content.entry_id = nil

      assert_raise(ActiveRecord::NotNullViolation) { @entry_content.save }
    end

    test "should save entry content if content is nil" do
      @entry_content.content = nil
      assert @entry_content.save
    end
  end
end
