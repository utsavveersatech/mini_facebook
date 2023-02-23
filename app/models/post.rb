class Post < ApplicationRecord
  has_many :userposts
  has_many :users, through: :userposts
end
