class CreateForumPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :forum_posts do |t|
      t.text :content, null: false
      t.integer :forum_thread_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
