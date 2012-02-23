class CreateMetadocs < ActiveRecord::Migration
  def change
    create_table :metadocs do |t|
      t.string :title
      t.string :tags
      t.text :content
      t.string :from_url
      t.string :from_mark
      t.datetime :collect_at
      t.boolean :public
      t.string :comment

      t.timestamps
    end
  end
end
