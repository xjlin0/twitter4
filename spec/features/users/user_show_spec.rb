include Warden::Test::Helpers
Warden.test_mode!

# Feature: User profile page
#   As a user
#   I want to visit my user profile page
#   So I can see my personal account data
feature 'User profile page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User sees own profile
  #   Given I am signed in
  #   When I visit the user profile page
  #   Then I see my own email address
  scenario 'user sees own profile and email' do
    user = FactoryGirl.create(:user, email: Faker::Internet.email)
    login_as(user, scope: :user)
    visit user_path(user)
    expect(page).to have_content 'User'
    expect(page).to have_content user.email
  end

  # Scenario: User cannot see another user's email
  #   Given I am signed in
  #   When I visit another user's profile
  #   Then I cannot see another user's email
  scenario "user cannot see another user's email" do
    me = FactoryGirl.create(:user, email: Faker::Internet.email)
    other = FactoryGirl.create(:user, email: Faker::Internet.email)
    login_as(me, scope: :user)
    Capybara.current_session.driver.header 'Referer', root_path
    visit user_path(other)
    expect(page).to have_no_content('email')
  end

end
