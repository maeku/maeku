require 'test_helper'

module Maeku
  module Editor
    class EntryPresenterTest < ActiveSupport::TestCase
      include ActionView::Helpers::DateHelper

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
        presenter_view_path = EntryPresenter.new(@entry_with_title).data[:urls][:show]
        expected_view_path = "/entries/4"
        assert presenter_view_path, expected_view_path
      end

      test "should return how long ago the entry was created" do
        presenter = EntryPresenter.new(@entry_with_title)
        presenter_created_at = presenter.data[:datetime][:created]
        expected_date = time_ago_in_words(@entry_with_title.created_at)
        time_ago_suffix = I18n.t('editor.models.entry_presenter.time_ago_suffix')
        expected_value = "#{expected_date} #{time_ago_suffix}"
        require 'pry'; binding.pry

        assert presenter_created_at, expected_value
      end

      test "should return how long ago the entry was updated" do
        presenter = EntryPresenter.new(@entry_with_title)
        presenter_updated_at = presenter.data[:datetime][:updated]
        expected_date = time_ago_in_words(@entry_with_title.updated_at)
        time_ago_suffix = I18n.t('editor.models.entry_presenter.time_ago_suffix')
        expected_value = "#{expected_date} #{time_ago_suffix}"

        assert presenter_updated_at, expected_value
      end
    end
  end
end
