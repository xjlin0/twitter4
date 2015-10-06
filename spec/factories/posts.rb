FactoryGirl.define do
  factory :post do
    content "MyString"
		user { create(:user, email: Faker::Internet.email) }
  end
end