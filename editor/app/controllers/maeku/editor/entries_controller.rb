module Maeku
  class Editor::EntriesController < Editor::BaseController

    def destroy
      Entry.destroy(params[:id])
    end

    def edit
      @entry = current_entry_presenter.data
    end

    def show
      @entry = current_entry_presenter.data
    end

    def update
      if current_entry.update(entry_params)
        render json: {
          status: response.code,
          entry: current_entry
        }
      else
        render :nothing, status: :unprocessable_entity
      end
    end

    private

    def current_entry
      Entry.find(params[:id])
    end

    def current_entry_presenter
      Editor::EntryPresenter.new(current_entry)
    end

    def entry_params
      params.require(:entry).permit(entry_content_attributes: [:content])
    end
  end
end
