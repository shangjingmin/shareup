class AddUserIdToMetadocs < ActiveRecord::Migration
  def change
    add_column :metadocs, :user_id, :integer
  end
end
