FactoryGirl.define do
  factory :followship do
    followee { create(:user, email: Faker::Internet.email) }
    follower { create(:user, email: Faker::Internet.email) }
  end
end
