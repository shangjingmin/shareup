class RenameCryptedPassword < ActiveRecord::Migration
  def up
    rename_column :users, :crypted_password, :encrypted_password
  end

  def down
    rename_column :users, :encrypted_password, :crypted_password
  end
end
