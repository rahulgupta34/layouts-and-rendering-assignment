class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  enum role: [:admin, :merchant]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
