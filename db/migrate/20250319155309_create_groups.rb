class CreateGroups < ActiveRecord::Migration[7.2]
  def change
    create_table :groups do |t|
      t.string :name, null: false # Required group name
      t.references :creator, null: false, foreign_key: { to_table: :users } # Group creator

      t.timestamps
    end
  end
end
