class Relationship < ApplicationRecord
  # The user giving the follow
  belongs_to :follower, foreign_key: :follower_id, class_name: "User"

  # The user being followed
  belongs_to :following, foreign_key: :following_id, class_name: "User"
end
