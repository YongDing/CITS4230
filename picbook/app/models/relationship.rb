class Relationship < ActiveRecord::Base
  attr_accessible :friend_id, :person_id
end
