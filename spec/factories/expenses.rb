FactoryGirl.define do
  factory :expense do
    cost 1.5
    due_date "2017-05-22 19:23:22"
    details "MyString"
    user
  end
end
