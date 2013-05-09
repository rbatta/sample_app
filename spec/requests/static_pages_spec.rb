require 'spec_helper'

describe "Static pages" do

  # this says that everything im doing is going to be on page.should/should_not
  subject { page }  

  # this removes dupes since they are all testing for the same kinds of things
  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Home page" do
    
    # this says that for describing page, go there first then do items listed
    before { visit root_path } 
   
    # these commands provide local variables
    let(:heading) { 'Sample App' }
    let(:page_title) { '' }

    # to test the shared_examples_for block above
    it_should_behave_like "all static pages"

    it { should_not have_selector 'title', text: '| Home' }
  end

  describe "Help page" do
    before { visit help_path }

    let(:heading) { 'Help' }
    let(:page_title) { 'Help' }

    it_should_behave_like "all static pages"

  end

  describe "About page" do
    before { visit about_path }

    let(:heading) { 'About' }
    let(:page_title) { 'About Me' }

    it_should_behave_like "all static pages"

  end

  describe "Contact page" do
    before { visit contact_path }

    let(:heading) { 'Contact' }
    let(:page_title) { 'Contact' }

    it_should_behave_like "all static pages"
  end

  # this tests out the links on page(s)
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Me')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    click_link "Home"
    click_link "Sign up now"
    page.should have_selector 'title', text: full_title('Sign up')
    click_link "sample app"
    page.should have_selector 'title', text: full_title('')
  end

end