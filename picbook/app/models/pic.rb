class Pic < ActiveRecord::Base
  belongs_to :user
    attr_accessible :photo, :prop, :title, :user_id, :created_at
    has_attached_file :photo
    
    validates :title, :presence => true
    validates_attachment_presence :photo;
    validates_attachment_content_type :photo, :content_type => ['image/png', 'image/jpg','image/gif','image/jpeg']
end
