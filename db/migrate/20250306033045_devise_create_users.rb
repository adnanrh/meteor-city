class DeviseCreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      # Devise fields

      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Confirmable (optional, enable if you want email confirmation flows)
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Trackable
      # t.integer :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string  :current_sign_in_ip
      # t.string  :last_sign_in_ip

      ## Lockable
      # t.integer :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string  :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      # Custom Meteor City fields
      t.string :username, null: false, index: { unique: true }
      t.string :display_name
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :profile_picture_url
      t.text :bio
      t.boolean :notifications_enabled, default: false

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end