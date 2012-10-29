require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

setup do
    @request.session[:user_id] = 9
end

test "should login" do
    ding = users(:ding)
    post :create, :email => 'yiling0816@163.com', :password => '22525225'
    assert_redirected_to login_url
    assert_equal ding.id, session[:user_id]
end

test "should fail login" do
    ding = users(:ding)
    post :create, :email => ding.email, :password => 'wrong'
    assert_redirected_to login_url
end

  test "should get destroy" do
    get :destroy
    assert_redirected_to :controller => 'picbook', :action => 'index'
  end

end
