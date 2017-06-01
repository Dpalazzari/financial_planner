FactoryGirl.define do
  factory :expense do
    cost 100
    due_date "2017-05-22 19:23:22"
    details "Rent"
    user
  end
end
