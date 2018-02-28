require 'rails_helper'

describe 'navigate' do

  before do
    @user = User.create(email: "123456@xxx.com", password: "123456", password_confirmation: "123456", first_name: "Dex", last_name: "Kuo")
    login_as(user, :scope => :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      post1 = Post.create(date: Date.today, rationable: 'Post1', user_id: @user.id)
      post2 = Post.create(date: Date.today, rationable: 'Post2', user_id: @user.id)
      visit posts_path
      expect(page).to have_content(/Post1|Post2/)
    end
  end




  describe "creation" do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationable]', with: "Some rationable"
      click_on 'Save'
      expect(page).to have_content("Some rationable")
    end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationable]' , with: "User Association"
      click_on 'Save'
      expect(User.last.posts.last.rationable).to eq("User Association")
    end
  end
end