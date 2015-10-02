# Feature: Follow a user
#   As a user
#   I want to follow another user
#   So I can be his/her follower (and track his/her posts)

# feature 'Follow a user' do

#   # Scenario: Follow a user
#   #   Given I am signed in
#   #   When I visit another user's page
#   #   Then I see "Follow"
#   scenario 'follow a user' do
#     follower = FactoryGirl.create(:user)
#     followee = FactoryGirl.create(:user, email: "another@email.com")
#     signin(user.email, user.password)
#     visit root_path
#     expect(page).to have_content I18n.t 'Follow'
#   end

# end
