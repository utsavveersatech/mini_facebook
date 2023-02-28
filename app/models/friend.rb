class Friend < ApplicationRecord
  scope :request, ->(follower_id) { Relationship.where(follower_id: follower_id, following_id: current_user.id, request_approved: false)}
end
