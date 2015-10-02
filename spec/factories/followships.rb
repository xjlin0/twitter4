FactoryGirl.define do
  factory :followship do
    followee { create(:user) }
    follower { create(:user, email: "another@email.com") }
  end
end
