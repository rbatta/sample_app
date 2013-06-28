require 'spec_helper'

describe "Authentication" do

	subject { page }

	describe "signin page" do
		before { visit signin_path }

		# checks signin with invalid info
		describe "with invalid info" do
			before { click_button "Sign in" }

			it { should have_selector('title', 	text: 'Sign in') }
			it { should have_error_message('Invalid') }

			describe "after visiting another page" do
				before { click_link "Home" }
				it { should_not have_selector('div.alert.alert-error') }
			end
			
		end

		# checks signin with valid info. email.upcase to ensure case insensitivity
		describe "with valid info" do
			let(:user) { FactoryGirl.create(:user) }
			before { valid_signin(user) }

			it { should have_selector('title', text: user.name) }
			it { should have_link('Profile', href: user_path(user)) }
			it { should have_link('Sign out', href: signout_path) }
			it { should_not have_link('Sign in', href: signin_path) }

			# clicking the signout page should result in "sign in" link
			describe "followed by signout" do
				before { click_link "Sign out" }
				it { should have_link('Sign in') }
			end
			
		end

	end
end
