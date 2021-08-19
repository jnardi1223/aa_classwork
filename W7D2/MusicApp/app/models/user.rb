class User < ApplicationRecord 
    validates :email, :session_token, uniqueness: true, presence: true 
    validates :password_digest, presence: true 
    
    after_initialize :create_session_token

    attr_reader :password 

    def create_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end 

    def reset_session_token! 
        self.session_token = SecureRandom::urlsafe_base64
        self.session_token.save!
        self.session_token 
    end 

    def password=(password)
        self.password = BCrypt::Password.create(password)
        password = value 
    end 

    def is_password?(password)
        password_object = BCrypt::Password.new(password)
        password_object.is_password?(password)
    end 

    def self.find_by_credntials(email, password)
        user = User.find(email)
        if user && user.is_password?(password)
            user 
        else 
            nil 
        end 
    end 
end 