# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Load default site data:
default_test_user = User.create(:email=>'cao7113@hotmail.com', 
                                :nickname=>'cao7113',
                                :password=>'admin',
                                :comment=>'default_test_user')

