class AddNameandimageToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string, null: false, default: "noname" , unique: true
    add_column :users, :image, :string
  end
end
