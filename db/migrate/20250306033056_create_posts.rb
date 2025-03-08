class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :post_type, null: false
      t.text :content
      t.string :caption  # Add caption field for image posts
      t.datetime :expires_at

      t.timestamps
    end
  end
end
