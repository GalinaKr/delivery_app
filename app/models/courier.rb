class Courier < ApplicationRecord
    has_many :packages, dependent: :destroy

    validates :name, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
