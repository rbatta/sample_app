require 'spec_helper'

describe "Static pages" do

  # ApplicationHelper module codes for this now.
  # let(:base_title) {"Ruby on Rails Tut Sample App"}

  describe "Home page" do

     it "should have the h1 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end

    it "should have the base title" do
      visit '/static_pages/home'
      page.should have_selector('title',
                        :text => "Ruby on Rails Tut Sample App")
    end

    it "should have a custom page title" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => '| Home')
    end

  end

  describe "Help page" do

    it "should have a custom page title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title',
                        :text => "Help")
    end

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1',
                        :text => "Help")
    end

    it "should have the base title" do
      visit '/static_pages/help'
      page.should have_selector('title',
                        :text => "Ruby on Rails Tut Sample App")
    end

  end

  describe "About page" do

    it "should have the title 'About Me'" do
      visit '/static_pages/about'
      page.should have_selector('title',
                        :text => "About Me")
    end

    it "should have the content 'About Me'" do
      visit '/static_pages/about'
      page.should have_selector('h1',
                        :text => "About Me")
    end

    it "should have the base title" do
      visit '/static_pages/about'
      page.should have_selector('title',
                        :text => "Ruby on Rails Tut Sample App")
    end
  end

  describe "Contact page" do

    it "should have the title 'Contact Me'" do
      visit '/static_pages/contact'
      page.should have_selector('title', 
                        :text => "Contact Me")
    end

    it "should have the content 'Contact Me'" do
      visit '/static_pages/contact'
      page.should have_selector('h1',
                        :text => "Contact Me")
    end

    it "should have the base title" do
      visit '/static_pages/contact'
      page.should have_selector('title',
                        :text => "Ruby on Rails Tut Sample App")
    end
  end

end