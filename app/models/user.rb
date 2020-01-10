class User < ApplicationRecord
  has_secure_password

  enum role: { admin: 0, user: 1 }

  has_many :articles, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end
