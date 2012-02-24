class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :user_id
      t.integer :tag_id
      t.integer :taggable_id
      t.string :taggable_type
      t.boolean :public
      t.datetime :tag_at

      t.timestamps
    end
  end
end
