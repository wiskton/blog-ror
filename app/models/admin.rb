class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :posts

  extend FriendlyId
  friendly_id :name, use: :slugged

  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable

  # def admin?
  #   return true
  # end
end
