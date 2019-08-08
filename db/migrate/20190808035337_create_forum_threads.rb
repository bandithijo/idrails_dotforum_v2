class CreateForumThreads < ActiveRecord::Migration[5.2]
  def change
    create_table :forum_threads do |t|
      t.string :title, limit: 100
      t.text :content
      t.integer :sticky_order, default: 100
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
