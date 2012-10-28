require 'test_helper'

class PicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    fixtures :pics

    
    test "pic attributes must not be empty" do
    pic = Pic.new
    assert pic.invalid?
    assert pic.errors[:title].any?
    assert pic.errors[:photo].any?
end

end
