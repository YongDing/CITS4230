class User < ActiveRecord::Base
    attr_accessible :birthday, :email, :firstName, :gender, :lastName, :password
    validates_confirmation_of :password
    attr_accessible :password_confirmation
    attr_accessor :password
    
    validates :birthday, :email, :firstName,:lastName, :gender,:password,
    :presence => true
    validates :email, :uniqueness => true
    validates_format_of  :email, :message => "has invalid format!", :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i   
end