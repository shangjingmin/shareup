class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :ref_count

      t.timestamps
    end
  end
end
