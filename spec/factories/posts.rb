FactoryGirl.define do
  factory :post do
    content "MyString"
		user { create(:user) }
  end
end