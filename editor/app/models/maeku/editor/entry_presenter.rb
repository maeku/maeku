module Maeku
  class Editor::EntryPresenter < SimpleDelegator
    include Maeku::Editor::Engine.routes.url_helpers

    attr_reader :entry, :id, :entry_content

    def initialize(entry)
      @entry = entry
      @id = entry.id
      @entry_content = entry.entry_content
    end

    def data
      {
        :id => id,
        :title => title,
        :content => content,
        :datetime => {
          :created => created_at,
          :updated => updated_at
        },
        :urls => {
          :edit => edit_entry_path(entry),
          :show => entry_path(entry),
        }
      }
    end

    def title
      entry_content.title || generate_title_from_content
    end

    def content
      entry_content.content
    end

    def created_at
      @entry.created_at
    end

    def updated_at
      @entry.updated_at
    end

    private

    def generate_title_from_content
      content = entry_content.content
      content.truncate(35, separator: /\s/)
    end
  end
end
