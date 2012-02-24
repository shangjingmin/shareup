class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :nickname
      t.string :realname
      t.string :mobile
      t.string :crypted_password
      t.string :home_url
      t.text :biography
      t.string :professional
      t.string :focus_fields
      t.string :interest
      t.date :birthday
      t.string :comment

      t.timestamps
    end
  end
end
