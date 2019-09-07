module Maeku
  class Editor::EntriesController < Editor::BaseController
    def show
      @entry = Editor::EntryPresenter.new(Entry.find(params[:id]))
    end

    def destroy
      Entry.destroy(params[:id])
    end
  end
end
