class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  # Will return an array of follows for the given user instance
  has_many :received_follows, foreign_key: :following_id, class_name: "Relationship"

  # Will return an array of users who follow the user instance
  has_many :followers, through: :received_follows, source: :follower

  # returns an array of follows a user gave to someone else
  has_many :given_follows, foreign_key: :follower_id, class_name: "Relationship"
  
  # returns an array of other users who the user has followed
  has_many :followings, through: :given_follows, source: :following

  # has_many :userposts, dependent: :destroy
  has_many :posts, dependent: :destroy
end
