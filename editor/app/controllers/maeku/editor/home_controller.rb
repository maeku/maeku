module Maeku
  class Editor::HomeController < Editor::BaseController

    def index
      @entries = Entry.all.where(author_id: current_author).map do |entry|
        {
          :id => entry.id,
          :content => entry.entry_content.content
        }
      end
    end

  end
end

