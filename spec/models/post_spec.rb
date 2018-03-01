require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do 
    before do
      @post = FactoryGirl.create(:post)
    end

    it 'can be create ' do
      expect(@post).to be_valid
    end

    it 'cannot be create' do
      @post.date = nil
      @post.rationable = nil
      expect(@post).to_not be_valid
    end
  end
end
