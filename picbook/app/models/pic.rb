class Pic < ActiveRecord::Base
  belongs_to :account
  attr_accessible :image, :prop, :title
end
