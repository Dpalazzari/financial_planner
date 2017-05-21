FactoryGirl.define do
  factory :user do
    name { Faker::GameOfthrones.character }
    email { Faker::Internet.safe_email }
    budget { Faker::Number.number(5)}
    password_digest "Babooshka"
  end
end
