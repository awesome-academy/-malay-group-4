User.create!(name: "Example User",
             email: "example@gmail.com",
             password: "foobar",
             password_confirmation: "foobar",
             activated: true,
             role: 1,
             activated_at: Time.zone.now)

 99.times do |n|
   name = Faker::Name.name
   email = "example-#{n+1}@gmail.com"
   password = "password"
   User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               role: 0,
               activated_at: Time.zone.now)
 end
