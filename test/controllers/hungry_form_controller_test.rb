require 'test_helper'

class HungryFormControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get submitted" do
    get :submitted
    assert_response :success
  end

end
