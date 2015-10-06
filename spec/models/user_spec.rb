describe User do

  # before(:each) do #using User#new will followship error due to the lack of user id
  # 	@quiGon = FactoryGirl.create(:user, email: 'quiGonJ@starwars.com')
  # 	@obiWan = FactoryGirl.create(:user, email: 'obiWanK@starwars.com')
  # 	@anakin = FactoryGirl.create(:user, email: 'anakinS@starwars.com')

  # 	#creation of the followship
  # 	@quiGon.fans << @obiWan
  # 	@quiGon.fans << @anakin
  # 	@obiWan.fans << @anakin
  # end

  #subject { @user; @quiGon; @obiWan; @anakin }

	it "should reject user creation without email" do
		expect(User.create(email: nil).errors.messages).to include(:email)
	end

	it "should reject user creation with duplicated email" do
    user = FactoryGirl.create(:user, email: Faker::Internet.email)
		expect(User.create(email: user.email).errors.messages).to include(:email)
    user.destroy
	end

	it "should reject user creation with password shorter than 8 characters" do
		expect(User.create(email: Faker::Internet.email, password:'short').errors.messages).to include(:password)
	end

  #it { should respond_to(:email) }

  it "#email returns a string" do
    email = Faker::Internet.email
    user = FactoryGirl.create(:user, email: email)
    expect(user.email).to match email
    user.destroy
  end

  #it { should respond_to(:fans) }

  it "#fans returns all fans of an user and #idols returns all idols the user's following" do
    quiGon = FactoryGirl.create(:user, email: 'quiGonJ@starwars.com')
    obiWan = FactoryGirl.create(:user, email: 'obiWanK@starwars.com')
    anakin = FactoryGirl.create(:user, email: 'anakinS@starwars.com')

    #creation of the followship
    quiGon.fans << obiWan
    quiGon.fans << anakin
    obiWan.fans << anakin

    expect(quiGon.fans.size).to match 2
    expect(quiGon.fans).to include(obiWan)
    expect(quiGon.fans).to include(anakin)

    expect(anakin.idols.size).to match 2
    expect(anakin.idols).to include(obiWan)
    expect(anakin.idols).to include(quiGon)    

    #clean up
    quiGon.fans.destroy_all if defined?(quiGon) && !quiGon.fans.blank?
    obiWan.fans.destroy_all if defined?(obiWan) && !obiWan.fans.blank?
    #@user.destroy
    quiGon.destroy if defined?(quiGon)
    obiWan.destroy if defined?(obiWan)
    anakin.destroy if defined?(anakin)
  end

  #it { should respond_to(:idols) }

  # it "#idols returns all idols the user's following" do
  #   @quiGon = FactoryGirl.create(:user, email: 'quiGonJ@starwars.com')
  #   @obiWan = FactoryGirl.create(:user, email: 'obiWanK@starwars.com')
  #   @anakin = FactoryGirl.create(:user, email: 'anakinS@starwars.com')

  #   #creation of the followship
  #   @quiGon.fans << @obiWan
  #   @quiGon.fans << @anakin
  #   @obiWan.fans << @anakin

  #   expect(@anakin.idols.size).to match 2
  #   expect(@anakin.idols).to include(@obiWan)
  #   expect(@anakin.idols).to include(@quiGon)
  # end

  # after(:each) do
  #   @quiGon.fans.destroy_all unless @quiGon.fans.blank?
  #   @obiWan.fans.destroy_all unless @obiWan.fans.blank?
  #   #@user.destroy
  #   @quiGon.destroy
  #   @obiWan.destroy
  #   @anakin.destroy
  # end
end
