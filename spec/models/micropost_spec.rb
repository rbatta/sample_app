# == Schema Information
#
# Table name: microposts
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Micropost do
  
  let(:user) { FactoryGirl.create(:user) }

  before do
  #	@micropost = Micropost.new(content: "This is the wrong way", user_id: user.id)
  	@micropost = user.microposts.build(content: "This is a post")
  end

  subject { @micropost }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "when user_id is not present" do
  	before { @micropost.user_id = nil }
  	it { should_not be_valid }
  end

  describe "with blank content" do
    before { @micropost.content = " " }
    it { should_not be_valid }
  end

  describe "with content that's too long" do
    before { @micropost.content = "a" * 101 }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
  	it "should not allow access to user_id" do
  		expect do
  			Micropost.new(user_id: user.id)
  		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  	end
  end
end