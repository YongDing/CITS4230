require 'test_helper'

class UserTest < ActiveSupport::TestCase

    fixtures :users
  # test "the truth" do
  #   assert true
  # end
    
    test "user attributes must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:email].any?
    assert user.errors[:firstName].any?
    assert user.errors[:lastName].any?
    assert user.errors[:gender].any?
    assert user.errors[:birthday].any?
    assert user.errors[:password].any?
    assert user.errors[:avatar].any?
end

test "user is not valid without a unique email" do
    user = User.new(:email => "yiling0816@163.com",
                    :firstName => "yong",
                    :lastName => "ding",
                    :gender => "Male",
                    :birthday => 1997-02-15,
                    :password => "22525225")
    assert !user.save
    assert_equal "has already been taken", user.errors[:email].join('; ')
end

end
