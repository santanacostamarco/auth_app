class User < ApplicationRecord
    has_secure_password #encriptar a senha
    validates name, presence: true
    validates password, presence: true
    VALID_EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    validates email, presence: true, format: {with: VALID_EMAIL_FORMAT}, uniqueness: {case_sensitive: false}
    before_save {self.email = email.downcase}
end
