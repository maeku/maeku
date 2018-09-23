require 'test_helper'

module Maeku
  class EntriesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @authored_entry = maeku_entries(:one)
      @unauthored_entry = maeku_entries(:two)
      # In the dummy application, the current_user always equals User.find(1).
    end

    test "should show author's entries index" do
      get entries_url
      assert_response :success
    end

    test "should show entries index if author has no entries" do
      Entry.destroy_all
      get entries_url
      assert_response :success
    end

    test "should allow starting a new entry" do
      get new_entry_url
      assert_response :success
    end

    test "should show entry" do
      get entry_url(@authored_entry)
      assert_response :success
    end

    test "should allow editing of authored entry" do
      get edit_entry_url(@authored_entry)
      assert_response :success
    end

    test "should only edit an entry that belongs to the author" do
      get edit_entry_url(@unauthored_entry)
      assert_response :redirect
    end

    test "should create entry" do
      assert_difference('Entry.count') do
        entry_text = "Today, I ate a tomato."
        post entries_url, params: { entry: { entry_content_attributes: { content: entry_text } } }
      end
      assert_redirected_to entry_url(Entry.last)
    end

    test "should update entry" do
      updated_entry = "Yesterday, I ate a tomato."
      patch entry_url(@authored_entry), params: { entry: { entry_content_attributes: { content: updated_entry } } }
      assert_redirected_to entry_url(@authored_entry)
    end

    test "should only update entry that belongs to the author" do
      updated_entry = "Yesterday, I ate a potato."
      patch entry_url(@unauthored_entry), params: { entry: { entry_content_attributes: { content: updated_entry } } }
      assert_not_equal @unauthored_entry.entry_content.content, updated_entry
    end

    test "should destroy entry" do
      assert_difference('Entry.count', -1) do
        delete entry_url(@authored_entry)
      end
      assert_redirected_to entries_url
    end

    test "should only destroy entry that belongs to the author" do
      assert_difference('Entry.count', 0) do
        delete entry_url(@unauthored_entry)
      end
    end

  end
end
