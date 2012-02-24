require 'test_helper'

class SearchsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
