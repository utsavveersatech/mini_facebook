class Relationship < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :following_id
      t.timestamps
    end
  end
end
