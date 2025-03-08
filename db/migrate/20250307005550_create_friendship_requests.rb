class CreateFriendshipRequests < ActiveRecord::Migration[7.2]
  def change
    create_table :friendship_requests do |t|
      t.references :requester, null: false, foreign_key: { to_table: :users }
      t.references :requested, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :friendship_requests, [:requester_id, :requested_id], unique: true
  end
end
