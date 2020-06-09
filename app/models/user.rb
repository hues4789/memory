class User < ApplicationRecord
    has_secure_password
    has_many :TLearnContext,dependent: :destroy
    validates :name, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, {presence: true,format: { with: VALID_EMAIL_REGEX }}
end
