User.destroy_all

100.times do
	u = User.create(name: Faker::Name.first_name, surname: Faker::Name.last_name, email: Faker::Internet.email)
  Bio.create(user_id: u.id, city: Faker::Address.city, birthday: Faker::Time.between(Time.now - 70.years, Time.now - 20.years))
end

p "done"
