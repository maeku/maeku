require 'test_helper'

module Maeku
  module Editor
    class EntryPresenterTest < ActiveSupport::TestCase
      include ActionView::Helpers::DateHelper
      include Maeku::Editor::Engine.routes.url_helpers

      setup do
        @entry = maeku_entries(:simple)
        @presenter = EntryPresenter.new(@entry)
        @entry_without_title = maeku_entries(:simple_untitled)
        @presenter_without_title = EntryPresenter.new(@entry_without_title)
      end

      test "should return entry's title" do
        assert @presenter.title, @entry.entry_content.title
      end

      test "should return truncated content if entry has no title" do
        generated_title = "A train whistling in the distance..."

        assert @presenter_without_title.title, generated_title
      end

      test "should return truncated content if entry title is an empty string" do
        entry = Maeku::Entry.new(
          author: authors(:bashō),
          entry_content_attributes: { title: '', content: @presenter.content }
        )

        presenter = EntryPresenter.new(entry)

        assert presenter.title, entry.entry_content.content.truncate(70, separator: /\s/)
      end

      test "should return entry content" do
        assert @presenter.content, @entry.entry_content.content
      end

      test "should return the entry edit path" do
        edit_path = @presenter.data[:urls][:edit]
        expected_edit_path = edit_entry_path(@entry.id)

        assert edit_path, expected_edit_path
      end

      test "should return the entry view path" do
        show_path = @presenter.data[:urls][:show]
        expected_show_path = entry_path(@entry.id)

        assert show_path, expected_show_path
      end

      test "should return how long ago the entry was created" do
        created_at = @presenter.data[:dateTime][:created]
        expected_date = time_ago_in_words(@entry.created_at)
        time_ago_suffix = I18n.t('editor.models.entry_presenter.time_ago_suffix')
        expected_value = "#{expected_date} #{time_ago_suffix}"

        assert created_at, expected_value
      end

      test "should return how long ago the entry was updated" do
        updated_at = @presenter.data[:dateTime][:updated]
        expected_date = time_ago_in_words(@entry.updated_at)
        time_ago_suffix = I18n.t('editor.models.entry_presenter.time_ago_suffix')
        expected_value = "#{expected_date} #{time_ago_suffix}"

        assert updated_at, expected_value
      end

      test "should return the iso created_at time from the record" do
        created_at = @presenter.data[:dateTime][:iso][:created]
        expected_date = @entry.created_at

        assert created_at, expected_date
      end

      test "should return the iso updated_at time from the record" do
        updated_at = @presenter.data[:dateTime][:iso][:updated]
        expected_date = @entry.updated_at

        assert updated_at, expected_date
      end
    end
  end
end
