class Post < ApplicationRecord
  # has_many :userposts
  belongs_to :user
end
