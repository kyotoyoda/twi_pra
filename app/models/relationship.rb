class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
<<<<<<< HEAD
  belongs_to :following, class_name: "User"
  validates :follower_id, presence: true
  validates :following_id, presence: true
=======
  belongs_to :followed, class_name: "User"
>>>>>>> origin/master
end
