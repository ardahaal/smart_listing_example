User.destroy_all

100.times do
	User.create(name: Faker::Name.first_name, surname: Faker::Name.last_name, email: Faker::Internet.email)
end

p "done"