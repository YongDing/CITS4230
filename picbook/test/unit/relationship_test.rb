require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    fixtures :relationships
    test "relationship attributes must not be empty" do
    relationship = Relationship.new
    end
end
