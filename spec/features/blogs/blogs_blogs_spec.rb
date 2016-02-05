require 'rails_helper'

RSpec.feature 'Blogs::Blogs', type: :feature do
  describe 'If user is anonymous' do
    it 'should show blog page' do
      user = create :user
      blog = create :blog, user_id: user.id
      visit conrateblogs.blog_path(blog)
    end

    it 'should not show the blog edit page' do
      user = create :user
      blog = create :blog, user_id: user.id
      visit conrateblogs.edit_blog_path(blog)
      expect(page).to have_content('Nincs joga megtekinteni az oldalt!')
      expect(current_path).to eq(main_app.home_path)
    end
  end

  describe 'If user is logged in ' do
    login_user

    it 'should not edit the blog' do
      user = create :user
      blog = create :blog, user_id: user.id
      visit conrateblogs.edit_blog_path(blog)
      expect(page).to have_content('Nincs joga megtekinteni az oldalt!')
      expect(current_path).to eq(main_app.home_path)
    end
  end

  describe 'If admin is logged in ' do
    login_user(true)

    it 'should create a new blog' #do

    # end

    it 'should edit the blog' do
      # user = create :user
      blog = create :blog, user_id: @user.id
      visit conrateblogs.edit_blog_path(blog)
      expect(page).not_to have_content('Nincs joga megtekinteni az oldalt!')
      expect(current_path).to eq(conrateblogs.edit_blog_path(blog))

      fill_in(I18n.t('activerecord.attributes.conrateblogs/blog.title'), with: 'Módosított napló')
      fill_in(I18n.t('activerecord.attributes.conrateblogs/blog.description'), with: 'Módosított leírás')
      click_button(I18n.t('helpers.submit.update', model: Conrateblogs::Blog.model_name.human))

      blog.reload
      expect(blog.title).to eq('Módosított napló')
      expect(blog.description).to eq('Módosított leírás')
    end

    it 'should destroy the blog', js: false do
      blog = create :blog, user_id: @user.id
      visit conrateblogs.blog_path(blog)
    end
  end
end
