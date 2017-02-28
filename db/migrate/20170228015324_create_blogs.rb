class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :permalink
      t.string :comments_feed_url

      t.timestamps
    end
  end
end
