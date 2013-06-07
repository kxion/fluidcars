require 'test_helper'

class SearchInfosControllerTest < ActionController::TestCase
  test "should get result" do
    get :result
    assert_response :success
  end

end
