module Maeku
  class Editor::HomeController < Editor::BaseController

    def index
      @entries = Entry.entries_for(current_author).map do |entry|
        Editor::EntryPresenter.new(entry).data
      end
    end
  end
end

