# frozen_string_literal: true

User.create!(name: 'Example User',
             email: 'example@railstutorial.org',
             password: 'passw0rd',
             password_confirmation: 'passw0rd',
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = 'passw0rd'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end
