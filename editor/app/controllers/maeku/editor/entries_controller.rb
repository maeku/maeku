module Maeku
  class Editor::EntriesController < Editor::BaseController

    def destroy
      Entry.destroy(params[:id])
    end

    def edit
      @entry = Editor::EntryPresenter.new(current_entry).data
    end

    def show
      @entry = Editor::EntryPresenter.new(current_entry)
    end

    def update
      respond_to do |format|
        if current_entry.update(entry_params)
          format.json { render json: current_entry, status: response.code }
          format.html { redirect_to entry_url(current_entry), notice: 'Updated!' }
        else
          format.html { render :edit }
        end
      end
    end

    private

    def current_entry
      Entry.find(params[:id])
    end

    def entry_params
      params.require(:entry).permit(entry_content_attributes: [:content])
    end
  end
end
