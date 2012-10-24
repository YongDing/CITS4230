require 'digest/sha2'

class User < ActiveRecord::Base
    
    has_many :pics
    
    
    
    attr_accessible :birthday, :email, :firstName, :gender, :lastName, :password, :avatar
    has_attached_file :avatar
    
    
    validates_confirmation_of :password
    attr_accessible :password_confirmation
    attr_accessor :password
    
    
    
    validates :birthday, :email, :firstName,:lastName, :gender,:password,
    :presence => true
    validates :email, :uniqueness => true
    validates_format_of  :email, :message => "has invalid format!", :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    
    

    def User.authenticate(email, password)
        if user = find_by_email(email)
            if user.hashed_password == encrypt_password(password, user.salt)
                user
            end
        end
    end
    
    def User.encrypt_password(password, salt)
        Digest::SHA2.hexdigest(password + "wibble" + salt)
    end
    
    # 'password' is a virtual attribute
    def password=(password)
        @password = password
        
        if password.present?
            generate_salt
            self.hashed_password = self.class.encrypt_password(password, salt)
        end
    end
    
    private
    
    def password_must_be_present
        errors.add(:password, "Missing password") unless hashed_password.present?
    end
    
    def generate_salt
        self.salt = self.object_id.to_s + rand.to_s
    end

end
