module Maeku
  class Editor::EntriesController < Editor::BaseController

    def edit
      @entry = Editor::EntryPresenter.new(current_entry).data
    end

    def show
      @entry = Editor::EntryPresenter.new(current_entry)
    end

    def destroy
      Entry.destroy(params[:id])
    end

    private

    def current_entry
      Entry.find(params[:id])
    end
  end
end
