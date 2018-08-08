module Maeku
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception

    helper_method :current_author?

    private

    def current_author
      if respond_to? :current_user
        current_user
      elsif Maeku.current_author
        Maeku.current_author
      else
        raise I18n.t 'controller.application.current_author.not_implemented'
      end
    end

    def current_author?
      @entry.author_id == current_author.id if @entry
    end
  end
end
