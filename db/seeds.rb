# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

User.first.update(password: "uuuuuuuu", img_url: "http://lorempixel.com/200/200", name: "Jack Jack")

#('a'..'e').each{|x| User.create(email: x+"@"+x+"."+x, password: x*8) }

##########seeding by Faker###############
testing_user_number  = 20
testing_post_number  = 100
post_max_word_number = 20
#testing_tag_number   = 3

testing_user_number.times do 
	User.create(
		name: Faker::Name.name, 
		email: Faker::Internet.email, 
		password: "uuuuuuuu",
		img_url: "http://lorempixel.com/200/200"
	)
end

users = User.all
users.each { |usr| usr.fans << users.sample( rand(1..users.length/3) ) }

testing_post_number.times do
	post = Post.create(
		user_id: rand(2..testing_user_number + 1),  #user_id 1 is admin
		content: Faker::Lorem.sentence( rand(1..post_max_word_number) ),
	)
end

#testing_post_number.times {Post.create(user_id: rand(2..testing_user_number + 1), content: Faker::Lorem.sentence( rand(1..post_max_word_number) ))}