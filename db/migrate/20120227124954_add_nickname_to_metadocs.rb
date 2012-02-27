class AddNicknameToMetadocs < ActiveRecord::Migration
  def change
    add_column :metadocs, :nickname, :string

  end
end
