class CreateGroupMemberships < ActiveRecord::Migration[7.2]
  def change
    create_table :group_memberships do |t|
      t.references :group, null: false, foreign_key: true
      t.references :friend, null: false, foreign_key: { to_table: :users } # Member of the group

      t.timestamps
    end
  end
end
