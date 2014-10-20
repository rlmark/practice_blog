class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :icon
      t.date :published
      t.text :entry

      t.timestamps
    end
  end
end
