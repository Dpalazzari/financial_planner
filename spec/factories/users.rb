FactoryGirl.define do
  factory :user do
    name { Faker::GameOfThrones.character }
    email { Faker::Internet.safe_email }
    budget { Faker::Number.number(5)}
    password "Babooshka"
    password_confirmation "Babooshka"
  end
end
