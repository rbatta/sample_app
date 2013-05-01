require 'spec_helper'

describe "Static pages" do

  let(:base_title) {"Ruby on Rails Tut Sample App"}

  describe "Home page" do

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title',
                        :text => "#{base_title} | Home")
    end

    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', 
                        :text => "Sample App")
    end

  end

  describe "Help page" do

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title',
                        :text => "#{base_title} | Help")
    end

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1',
                        :text => "Help")
    end

  end

  describe "About page" do

    it "should have the title 'About Me'" do
      visit '/static_pages/about'
      page.should have_selector('title',
                        :text => "#{base_title} | About Me")
    end

    it "should have the content 'About Me'" do
      visit '/static_pages/about'
      page.should have_selector('h1',
                        :text => "About Me")
    end
  end

  describe "Contact page" do

    it "should have the title 'Contact Me'" do
      visit '/static_pages/contact'
      page.should have_selector('title', 
                        :text => "#{base_title} | Contact Me")
    end

    it "should have the content 'Contact Me'" do
      visit '/static_pages/contact'
      page.should have_selector('h1',
                        :text => "Contact Me")
    end
  end

end