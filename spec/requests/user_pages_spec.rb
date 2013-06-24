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

    let(:submit) { "Create my account" }

    # checks the before clicking submit and after clicking submit
    # to see if User.count has changed (it shouldn't have)
    describe "with invalid info" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_selector('title', text: 'Sign up') }
        it { should have_content('error') }
      end
    end

    # fills in the form, then checks to see if user was created
    # and count has +1'd
    describe "with valid info" do
      before do
        fill_in "Name",         with: "Test user"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "testtest"
        fill_in "Confirmation", with: "testtest"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email('user@example.com') }

        it { should have_selector('title', text: user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
        it { should have_link('Sign out') }
      end

    end

  end
end
