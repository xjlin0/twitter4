include Warden::Test::Helpers
Warden.test_mode!

# Feature: User index page
#   As a user
#   I want to see a list of users
#   So I can see who has registered
feature 'User index page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User listed on index page
  #   Given I am signed in
  #   When I visit all user index page
  #   Then I cannot see everybody's email address
  scenario "logged in user cannot see others email address in all users's index page" do
    user = FactoryGirl.create(:user, email: Faker::Internet.email)
    login_as(user, scope: :user)
    visit users_path   #this is all users page
    expect(page).to have_no_content user.email
    user.destroy
  end

end
