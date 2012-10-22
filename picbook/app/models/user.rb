require 'digest/sha2'
class User < ActiveRecord::Base
    attr_accessible :birthday, :email, :firstName, :gender, :lastName, :password, :profile
    validates_confirmation_of :password
    attr_accessible :password_confirmation
    attr_accessor :password
    
    has_many :pics
    
    validates :birthday, :email, :firstName,:lastName, :gender,:password,
    :presence => true
    validates :email, :uniqueness => true
    validates_format_of  :email, :message => "has invalid format!", :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    
    
    
    def User.authenticate(name, password)
        if user = find_by_name(name)
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
