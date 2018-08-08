module Journal
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception

    helper_method :current_author?

    private

    def current_author
      if respond_to? :current_user
        current_user
      elsif Journal.current_author
        Journal.current_author
      else
        raise "Your application needs a 'current_user' method. This method is "\
          "typically provided if you use an authentication gem like devise."
      end
    end

    def current_author?
      @entry.author_id == current_author.id if @entry
    end
  end
end
