require_dependency "journal/application_controller"

module Journal
  class EntriesController < ApplicationController
    before_action :set_entry, only: [:show, :edit, :update, :destroy]

    def index
      @entries = current_author.entries
    end

    def show
    end

    def new
      @entry = Entry.new
    end

    def edit
      unless current_author?
        flash[:error] = I18n.t 'controller.entries.edit.error'
        redirect_to entries_url
      end
    end

    def create
      @entry = Entry.new(entry_params)
      @entry.author_id = current_author.id

      if @entry.save
        flash[:notice] = I18n.t 'controller.entries.create.success'
        redirect_to @entry
      else
        flash[:error] = I18n.t 'controller.entries.create.error'
        render :new
      end
    end

    def update
      if @entry.update(entry_params) && current_author?
        flash[:notice] = I18n.t 'controller.entries.update.success'
        redirect_to @entry
      else
        flash[:error] = I18n.t 'controller.entries.update.error'
        render :edit
      end
    end

    def destroy
      @entry = Entry.find(params[:id])
      if current_author?
        @entry.destroy
        flash[:notice] = I18n.t 'controller.entries.destroy.success'
        redirect_to entries_url
      else
        flash[:error] = I18n.t 'controller.entries.destroy.error'
        redirect_to entries_url
      end
    end

    private

    def entry_params
      params.require(:entry).permit(:entry, :author_id)
    end

    def set_entry
      @entry = Entry.find(params[:id])
    end

  end
end
