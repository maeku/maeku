module Maeku
  class Editor::BaseController < ::Maeku::ApplicationController
    skip_before_action :verify_authenticity_token
  end
end
