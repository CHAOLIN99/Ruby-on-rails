FactoryBot.define do
  factory :user do |f|
    f.sequence(:first_name) { |n| "John#{n}" }
    f.sequence(:last_name) { |n| "Doe#{n}" }
    f.sequence(:email) { |n| "123#{n}@test.com" }
    f.password { "password" }
    f.password_confirmation { |d| d.password }

  end

  
end