FactoryBot.define do
  factory :user do |f|
    f.squence(:first_name) { |n| "John#{n}" }
    f.squence(:last_name) { |n| "Doe#{n}" }
    f.squence(:email) { |n| "123#{n}@test.com" }
    f.password { "password" }
    f.password_confirmation { |d| d.password }

  end
end