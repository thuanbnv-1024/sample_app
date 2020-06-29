User.create!(name: "Example User",
            email: "example@gmail.com",
            password: "123456",
            password_confirmation: "123456",
            admin:true,
            activated: true,
            activated_at: Time.zone.now)
# Generate a bunch of additional users.
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "123456"
  User.create!(name: name,
              email: email,
              password: password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end
users = User.order(:created_at).take(6)
  30.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end
