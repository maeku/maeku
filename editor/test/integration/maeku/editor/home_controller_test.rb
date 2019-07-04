require 'test_helper'

module Maeku
  class Editor::HomeControllerTest < ActionDispatch::IntegrationTest

    test "index should be the editor home" do
      get "/editor"
      assert_response :success
    end

  end
end
