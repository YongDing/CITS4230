class Pic < ActiveRecord::Base
  belongs_to :user
    attr_accessible :photo, :prop, :title, :user_id, :created_at
    has_attached_file :photo
end
