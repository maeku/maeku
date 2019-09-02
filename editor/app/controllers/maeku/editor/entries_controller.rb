module Maeku
  class Editor::EntriesController < Editor::BaseController
    def destroy
      Entry.destroy(params[:id])
    end
  end
end

