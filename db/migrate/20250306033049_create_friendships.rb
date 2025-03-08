class CreateFriendships < ActiveRecord::Migration[7.2]
  def change
    create_table :friendships do |t|
      t.bigint :user1_id, null: false
      t.bigint :user2_id, null: false

      t.index [:user1_id, :user2_id], unique: true

      t.timestamps
    end

    # Enforce that both users actually exist
    add_foreign_key :friendships, :users, column: :user1_id
    add_foreign_key :friendships, :users, column: :user2_id
  end
end
