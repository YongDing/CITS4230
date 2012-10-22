require 'digest/sha2'
class User < ActiveRecord::Base
    attr_accessible :birthday, :email, :firstName, :gender, :lastName, :password
    validates_confirmation_of :password
    attr_accessible :password_confirmation
    attr_accessor :password
    
    has_many :pics
    validates :birthday, :email, :firstName,:lastName, :gender,:password,
    :presence => true
    validates :email, :uniqueness => true
    validates_format_of  :email, :message => "has invalid format!", :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    
    before_save :encrypt_password
    
    def authenticate?(submitted_password)
		encrypted_password == encrypt(submitted_password)
    end
    
    private
  	
    def encrypt_password
		self.salt = make_salt if new_record?
		self.encrypted_password = encrypt(password)
	end
    
	def encrypt(string)
		secure_hash("#{salt}--#{string}")
	end
    
	def make_salt
		secure_hash("#{Time.now.utc}--#{password}")
	end
    
	def secure_hash(string)
		Digest::SHA2.hexdigest(string)
	end
end
