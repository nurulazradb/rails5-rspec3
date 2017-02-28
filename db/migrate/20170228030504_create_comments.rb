class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.string :link
      t.string :commenter
      t.text :description
      t.datetime :opined_at
      t.references :blog, foreign_key: true

      t.timestamps
    end
  end
end
