class Posts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.string :imageUrl
      t.timestamps
    end
  end
end
