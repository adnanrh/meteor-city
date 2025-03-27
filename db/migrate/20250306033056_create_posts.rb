class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :post_type, null: false
      t.text :content
      t.string :caption  # Add caption field for image posts
      t.integer :visibility, default: 0, null: false # 0 = global, 1 = group_only
      t.references :group, foreign_key: true, null: true # Nullable, only if it's a group post
      t.datetime :expires_at
      t.boolean :expired, default: false, null: false

      t.timestamps
    end
  end
end
