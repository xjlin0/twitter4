describe User do

  before(:each) do #using User#new will followship error due to the lack of user id
  	@user   = FactoryGirl.create(:user, email: 'user@example.com')
  	@quiGon = FactoryGirl.create(:user, email: 'quiGonJ@starwars.com')
  	@obiWan = FactoryGirl.create(:user, email: 'obiWanK@starwars.com')
  	@anakin = FactoryGirl.create(:user, email: 'anakinS@starwars.com')

  	#creation of the followship
  	@quiGon.fans << @obiWan
  	@quiGon.fans << @anakin
  	@obiWan.fans << @anakin
  end

  subject { @user; @quiGon; @obiWan; @anakin }

	it "should reject user creation without email" do
		expect(User.create(email: nil).errors.messages).to include(:email)
	end

	it "should reject user creation with duplicated email" do
		expect(User.create(email: 'user@example.com').errors.messages).to include(:email)
	end

	it "should reject user creation with password shorter than 8 characters" do
		expect(User.create(email: 'user@example.com', password:'short').errors.messages).to include(:password)
	end

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match 'user@example.com'
  end

  it { should respond_to(:fans) }

  it "#fans returns all fans of an user" do
    expect(@quiGon.fans.size).to match 2
    expect(@quiGon.fans).to include(@obiWan)
    expect(@quiGon.fans).to include(@anakin)
  end

  it { should respond_to(:idols) }

  it "#idols returns all idols the user's following" do
    expect(@anakin.idols.size).to match 2
    expect(@anakin.idols).to include(@obiWan)
    expect(@anakin.idols).to include(@quiGon)
  end

end
