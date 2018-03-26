module Journal
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception

    helper_method :current_author, :logged_in?

    private

    # wip: uses session variables to check who the current author is. this
    # should not depend on a devise-style "current_user" because the
    # application may not use devise.
    def current_author
    end

    # wip: if there is a current_author, then logged_in is true.
    def logged_in?
    end

  end
end
