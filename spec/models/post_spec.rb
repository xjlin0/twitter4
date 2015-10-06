# require 'rails_helper'

# RSpec.describe Post, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end



describe Post do

  before(:each) do
  	@user = FactoryGirl.create(:user, email: Faker::Internet.email)
  	@post = Post.new(content: 'example content', user_id: @user.id)
  end

  #subject { @post }

  it "should reject post creation without content" do
    expect(Post.create(content: nil).errors.messages).to include(:content)
  end

  it "should reject post creation without poster/user" do
    expect(Post.create(user_id: nil).errors.messages).to include(:user_id)
  end

  it "should reject post with content longer than 140 character" do
    expect(Post.create(user_id: @user.id, content: "c"*141).errors.messages).to include(:content)
  end

  #it { should respond_to(:content) }

  it "#content returns a string" do
    expect(@post.content).to match 'example content'
  end

  #it { should respond_to(:user_id) }

  it "#user_id returns its poster id(user_id)" do
    expect(@post.user_id).to match @user.id
  end

  #it { should respond_to(:user) }

  it "#user returns its poster (user instance)" do
    expect(@post.user).to match @user
  end

  after(:each) do
    @user.destroy
    @post.destroy
  end

end