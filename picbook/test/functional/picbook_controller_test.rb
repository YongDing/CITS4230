require 'test_helper'

class PicbookControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
