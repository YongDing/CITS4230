require 'test_helper'

class PicbookControllerTest < ActionController::TestCase
    
    setup do
        @pics = Pic.limit(4).order("created_at DESC")
    end

  test "should get index" do
    get :index
    assert_response :success
  end

end
