class CreateDocshots < ActiveRecord::Migration
  def change
    create_table :docshots do |t|
      t.string :url
      t.text :content
      t.string :comment

      t.timestamps
    end
  end
end
