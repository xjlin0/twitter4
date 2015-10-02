# require 'rails_helper'

# RSpec.describe Followship, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Followship do

  before(:each) do #using User#new will followship error due to the lack of user id
  	@followee   = FactoryGirl.create(:user, email: 'followee@example.com')
  	@follower   = FactoryGirl.create(:user, email: 'follower@example.com')
  	@followship = Followship.create(followee: @followee, follower: @follower)
  end

  subject { @followship }

  it "should reject followship creation without followee_id" do
    expect(Followship.create(followee_id: nil).errors.messages).to include(:followee_id)
  end

  it "should reject followship creation without follower_id" do
    expect(Followship.create(follower_id: nil).errors.messages).to include(:follower_id)
  end

  it "should reject duplicated followship creation" do
    expect(Followship.create(followee: @followee, follower: @follower).errors.messages).to include(:followee_id)
  end

  it { should respond_to(:followee) }

  it "#followee_id returns the id of the user been followed" do
    expect(@followship.followee_id).to match @followee.id
  end

  it "#followee returns the user instance been followed" do
    expect(@followship.followee).to match @followee
  end

  it { should respond_to(:follower) }

  it "#follower_id returns the id of the follower" do
    expect(@followship.follower_id).to match @follower.id
  end

  it "#follower returns the instance of the follower" do
    expect(@followship.follower).to match @follower
  end

end