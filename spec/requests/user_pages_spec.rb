require 'spec_helper'

describe "User Pages" do
  
  subject { page }

  describe "profile page" do
    # Code to make a user variable user factory_girl
    # made it work with "no 'users' table" error by running
    #   bundle exec rake db:test:prepare
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1',   text: user.name ) }
    it { should have_selector('title',  text: user.name ) }
  end

  describe "sign up page" do
    before { visit signup_path }

    it { should have_selector('h1', text: 'Sign up') }
    it { should have_selector('title', text: full_title('Sign up')) }
  end

end
