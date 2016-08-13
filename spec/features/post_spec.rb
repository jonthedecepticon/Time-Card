require 'rails_helper'

describe 'navigate' do
  before do
    @user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "Test", last_name: "User")
    login_as(@user, :scope => :user)
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
      post1 = Post.create(date: Date.today, rational: "First", user_id: @user.id)
      post2 = Post.create(date: Date.today, rational: "Second", user_id: @user.id)
      visit posts_path
      expect(page).to have_content(/First|Second/)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of New Post' do
      expect(page).to have_content(/New Post/)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rational]', with: "Some rationale"
      click_on "Save"
      expect(page).to have_content("Some rationale")
    end

    it 'will have a user associated to it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rational]', with: "User_Assocation"
      click_on "Save"
      expect(User.last.posts.last.rational).to eq("User_Assocation")
    end
  end


end
