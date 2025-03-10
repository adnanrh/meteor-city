class CreateInvites < ActiveRecord::Migration[7.2]
  def change
    create_table :invites do |t|
      t.references :inviter, null: false, foreign_key: { to_table: :users }
      t.string :token, null: false, index: { unique: true }
      t.datetime :expires_at, null: false

      t.timestamps
    end
  end
end
