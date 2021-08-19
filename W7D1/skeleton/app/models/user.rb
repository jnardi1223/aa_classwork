class User < ApplicationRecord
    validates :username, :session_token, uniqueness: true, presence: true  
    validates :password_digest, presence: true 
  

    attr_reader :password 

    after_initialize :create_session_token

    def create_session_token #ensure_session_token 
        self.session_token ||= SecureRandom::urlsafe_base64  
    end 

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64 
        self.save! 
        self.session_token 
    end 

    def password=(value)
        self.password_digest = BCrypt::Password.create(value)
        @password = value 
    end 

    def is_password?(password)
        password_object = BCrypt::Password.new(self.password_digest)
        password_object.is_password?(password)
    end 

    def self.find_by_credentials(username, password)
        user = User.find(username)
        if user && user.is_password?(password)
            user 
        else 
            nil 
        end
    end 

end
