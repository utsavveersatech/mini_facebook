class Post < ApplicationRecord
  # has_many :userposts
  belongs_to :user

  scope :find_post, ->(id) { Post.find(id) }
end
