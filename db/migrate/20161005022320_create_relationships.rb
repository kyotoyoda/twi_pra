class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id #フォローフォロワーのリレーションシップというテーブルをデータベースに追加

      t.timestamps
      add_index :relationships, :follower_id #引用をシンプルにするためにindex指定する
      add_index :relationships, :followed_id
      add_index :relationships, [:follower_id, :followed_id], unique:true #あるユーザーが２度以上１人のユーザーをフォローできないように
    end
  end
end
