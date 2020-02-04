class User < ApplicationRecord
  has_secure_password

  Password_Requirement = /\A
  (?=.{8,}) #Atleast 8 characters long
  (?=.*\d) #Atleast contain 1 number
  (?=.*[a-z]) #Contain atleast one lowercase letter
  (?=.*[A-Z]) #Contain atleast one uppercase letter
  (?=.*[[:^alnum:]]) #Contain atleast one symbol
  /x

  enum role: { admin: 0, user: 1 }

  has_many :articles, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password, format: Password_Requirement


end
