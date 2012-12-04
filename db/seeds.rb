# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

# initialize Category table
if Category.count == 0
  Category.create([{content: "Art"}, 
                   {content: "Books"}, 
                   {content: "Electronics"}, 
                   {content: "Beauty"}, 
                   {content: "Cloth & Accessories"}])
end

# set admin
#adm = Administrator.find(:first, :conditions => {:user_id => 2})
#adm.admin = true
#adm.save


