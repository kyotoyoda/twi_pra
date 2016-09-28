class ChangeNameOptionsToUsers < ActiveRecord::Migration[5.0]
  def change
    def up
      change_column :users, :name, :string, null: false, default: "noname"
    end

    def down
      change_column :users, :name, :string, null:true, default: nil
    end
      add_index :users, :name, unique: true

  end
end
