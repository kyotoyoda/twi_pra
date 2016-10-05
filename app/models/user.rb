class User < ApplicationRecord
  has_many :tweets, dependent: :destroy　#ユーザーを削除した時、投稿も一緒に削除されるようにする
  has_many :likes
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy #relatinoshipsテーブルにおいて、User_idキーではなく、Follower_idというものでユーザーテーブルと結びつけるということを明示
  has_many :followed_users, through: :relationships, source: :followed　#soureceはfollowed_users_idが、followed_idであることを明示
  has_many :reverse_relationships, foreign_key: "followed_id", class_name:"Relationship", #reverse_relationshipsというクラスは仮想であるため、実際に使っているrelatinoshipsというクラスを明示
            dependent: :destroy
  has_many :followers, through: :reberse_relationships, source: :follower

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence:true, length: {maximum: 50}

def following?(other_user)
  relationships.find_by(followed_id: other_user.id)
end

def follow!(other_user)
  relationships.create!(followed_id: other_user.id)
end

def unfollow!(other_user)
  relatinoships.find_by(followed_id: other_user.id).destroy
end

end
