module Maeku
  class Editor::EntryPresenter < SimpleDelegator
    attr_reader :id, :entry_content

    def initialize(entry)
      @id = entry.id
      @entry_content = entry.entry_content
    end

    def data
      {
        :id => id,
        :title => title,
        :content => content
      }
    end

    def title
      entry_content.title || generate_title_from_content
    end

    def content
      entry_content.content
    end

    private

    def generate_title_from_content
      content = entry_content.content
      content.truncate(35, separator: /\s/)
    end
  end
end
