class User < ApplicationRecord
  has_many :tweets, dependent: :destroy #ユーザーを削除した時、投稿も一緒に削除されるようにする
  has_many :likes
<<<<<<< HEAD

  has_many :active_relationships,foreign_key: :following_id,class_name: Relationship, dependent: :destroy
  has_many :followings, through: :active_relationships
  has_many :passive_relationships, foreign_key: :follower_id,class_name: Relationship , dependent: :destroy
  has_many :followers, through: :passive_relationships
=======
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy #relatinoshipsテーブルにおいて、User_idキーではなく、Follower_idというものでユーザーテーブルと結びつけるということを明示
  has_many :followed_users, through: :relationships, source: :followed #soureceはfollowed_users_idが、followed_idであることを明示
  has_many :reverse_relationships, foreign_key: "followed_id", class_name:"Relationship",dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
>>>>>>> origin/master

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence:true, length: {maximum: 50}

<<<<<<< HEAD
  #ユーザーをフォロー
  def follow(other_user)
    active_relationships.create(following_id: other_user.id)
  end

  #ユーザーをあんフォロー
  def unfollow(other_user)
    active_relationships.find_by(following_id: other_user.id).destroy
  end

  #現在のユーザーがフォローしていたらtrueを返す
  def following?(other_user)
    active_relationships.find_by(follower_id: other_user.id)
  end
=======
  #def current_user?(user)
  #  user == current_user
  #end

def following?(other_user)
  relationships.find_by(followed_id: other_user.id)
end

def follow!(other_user)
  relationships.create!(followed_id: other_user.id)
end

def unfollow!(other_user)
  relatinoships.find_by(followed_id: other_user.id).destroy
end
>>>>>>> origin/master

end
