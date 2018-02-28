require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = User.create(email: "123456@xxx.com", password: "123456", password_confirmation: "123456", first_name: "Dex", last_name:"Kuo")
  end

  describe "creation" do
    
    it "can be create" do
      expect(@user).to be_valid
    end
    it "cannot be create without first_name, last_name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end

  describe "custom name methods" do
    it 'has a full name method that combines first and last name' do
      expect(@user.full_name).to eq("DEX KUO")
    end
  end
end
