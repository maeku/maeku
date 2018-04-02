module Journal
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception

    helper_method :current_author

    private

    def current_author
      if defined? Journal.current_author
        Journal.current_author.constantize
      elsif defined? current_user
        current_user
      else
        raise "Your application needs a 'current_user' method. This method is "/
          "typically provided if you use an authentication gem like devise."
      end
    end

  end
end
