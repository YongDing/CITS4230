class Pic < ActiveRecord::Base
  belongs_to :user
    attr_accessible :image, :prop, :title, :user_id
end
