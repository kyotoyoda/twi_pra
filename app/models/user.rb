class User < ApplicationRecord
  has_many :tweets, dependent: :destroy
  has_many :likes

  has_many :active_relationships,class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :following #sつける？
  has_many :passive_relationships,class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence:true, length: {maximum: 50}

  #ユーザーをフォロー
  def follow(other_user)
    active_relationships.create(following_id: other_user.id)
  end

  #ユーザーをあんフォロー
  def unfollow(other_user)
    active_relationships.find_by(following_id: other_user.id)
  end

  #現在のユーザーがフォローしていたらtrueを返す
  def following?(other_user)
    followings.include?(other_user)
  end

end
