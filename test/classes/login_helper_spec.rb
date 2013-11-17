require 'minitest_helper'

describe LoginHelper do
  before :each do 
    @l = Class.new do; include LoginHelper end.new
  end

  it "should have a method to provide a username" do
    @l.must_respond_to :user
  end

  it "should have a method to provide a password for a username" do
    @l.must_respond_to :password
  end
end
