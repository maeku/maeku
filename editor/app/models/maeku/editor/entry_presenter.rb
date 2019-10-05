module Maeku
  class Editor::EntryPresenter < SimpleDelegator
    include ActionView::Helpers::DateHelper
    include Maeku::Editor::Engine.routes.url_helpers

    attr_reader :entry, :id, :entry_content

    def initialize(entry)
      @entry = entry
      @entry_content = entry.entry_content
      @id = entry.id
    end

    def data
      {
        :id => id,
        :title => title,
        :content => content,
        :datetime => datetime,
        :urls => urls
      }
    end

    def title
      entry_content.title || generate_title_from_content
    end

    def content
      entry_content.content
    end

    def datetime
      {
        :created => created_at,
        :updated => updated_at,
        :iso => {
          :created => entry.created_at,
          :updated => entry.updated_at
        }
      }
    end

    def urls
      {
        :edit => edit_entry_path(entry),
        :show => entry_path(entry),
      }
    end

    private

    def created_at
      datetime = entry.created_at
      time_ago_suffix = I18n.t('editor.models.entry_presenter.time_ago_suffix')
      return "#{time_ago_in_words(datetime)} #{time_ago_suffix}"
    end

    def updated_at
      datetime = entry.updated_at
      time_ago_suffix = I18n.t('editor.models.entry_presenter.time_ago.suffix')
      return "#{time_ago_in_words(datetime)} #{time_ago_suffix}"
    end

    def generate_title_from_content
      content = entry_content.content
      content.truncate(70, separator: /\s/)
    end
  end
end
