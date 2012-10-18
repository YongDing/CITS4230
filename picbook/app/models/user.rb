class User < ActiveRecord::Base
  attr_accessible :birthday, :email, :firstName, :gender, :lastName, :password
end
