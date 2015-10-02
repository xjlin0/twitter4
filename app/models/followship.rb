class Followship < ActiveRecord::Base
  belongs_to :followee, class_name: 'User', counter_cache: :followee_count
  belongs_to :follower, class_name: 'User', counter_cache: :follower_count

  validates :followee_id, presence: true
  validates :follower_id, presence: true

  validates :followee_id, uniqueness: {scope: :follower_id}
end
