require 'test_helper'

module Journal
  class EntriesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @authored_entry = journal_entries(:one)
      @unauthored_entry = journal_entries(:two)
      # current_user always equals User.find(1)
    end

    test "should get entries index" do
      get entries_url
      assert_response :success
    end

    test "should get new entry" do
      get new_entry_url
      assert_response :success
    end

    test "should show entry" do
      get entry_url(@authored_entry)
      assert_response :success
    end

    test "should get edit for authored entry" do
      get edit_entry_url(@authored_entry)
      assert_response :success
    end

    test "should not get edit for another author's entry" do
      get edit_entry_url(@unauthored_entry)
      assert_response :redirect
    end

    test "should create entry" do
      assert_difference('Entry.count') do
        entry_text = "Today, I ate a tomato."
        post entries_url, params: { entry: { entry: entry_text } }
      end
      assert_redirected_to entry_url(Entry.last)
    end

    test "should update entry" do
      updated_entry = "Yesterday, I ate a tomato."
      patch entry_url(@authored_entry), params: { entry: { entry: updated_entry } }
      assert_redirected_to entry_url(@authored_entry)
    end

    test "should not update another author's entry" do
      updated_entry = "Yesterday, I ate a potato."
      patch entry_url(@unauthored_entry), params: { entry: { entry: updated_entry } }
      assert_not_equal @unauthored_entry.entry, updated_entry
    end

    test "should destroy entry" do
      assert_difference('Entry.count', -1) do
        delete entry_url(@authored_entry)
      end
      assert_redirected_to entries_url
    end

    test "should not destroy another author's entry" do
      assert_difference('Entry.count', 0) do
        delete entry_url(@unauthored_entry)
      end
      assert_redirected_to entries_url
    end

  end
end
