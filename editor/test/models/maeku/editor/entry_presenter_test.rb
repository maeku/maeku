require 'test_helper'

module Maeku
  module Editor
    class EntryPresenterTest < ActiveSupport::TestCase

      setup do
        @entry_with_title = maeku_entries(:four)
        @entry_without_title = maeku_entries(:five)
      end

      test "should return entry's title" do
        presenter_title = EntryPresenter.new(@entry_with_title).title
        entry_title = @entry_with_title.entry_content.title
        assert presenter_title, entry_title
      end

      test "should return truncated content if entry has no title" do
        presenter_title = EntryPresenter.new(@entry_without_title).title
        generated_title = "A train whistling in the distance..."
        assert presenter_title, generated_title
      end

      test "should return entry content" do
        presenter_content = EntryPresenter.new(@entry_with_title).content
        entry_content = @entry_with_title.entry_content.content
        assert presenter_content, entry_content
      end

      test "should return the entry edit path" do
        presenter_edit_path = EntryPresenter.new(@entry_with_title).data[:urls][:edit]
        expected_edit_path = "/entries/4/edit"
        assert presenter_edit_path, expected_edit_path
      end

      test "should return the entry view path" do
        presenter_view_path = EntryPresenter.new(@entry_with_title).data[:urls][:view]
        expected_view_path = "/entries/4"
        assert presenter_view_path, expected_view_path
      end
    end
  end
end
