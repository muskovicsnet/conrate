require 'rails_helper'

RSpec.feature 'Webshop::Categories', type: :feature do
  describe 'If user is anonymous' do
    # it 'should show blog page' do
    #   user = create :user
    #   blog = create :blog, user_id: user.id
    #   visit conrateblogs.blog_path(blog)
    # end
    #
    # it 'should not show the blog edit page' do
    #   user = create :user
    #   blog = create :blog, user_id: user.id
    #   visit conrateblogs.edit_blog_path(blog)
    #   expect(page).to have_content('Nincs joga megtekinteni az oldalt!')
    #   expect(current_path).to eq(main_app.home_path)
    # end
  end

  describe 'If user is logged in ' do
    # login_user
    #
    # it 'should not edit the blog' do
    #   user = create :user
    #   blog = create :blog, user_id: user.id
    #   visit conrateblogs.edit_blog_path(blog)
    #   expect(page).to have_content('Nincs joga megtekinteni az oldalt!')
    #   expect(current_path).to eq(main_app.home_path)
    # end
  end

  describe 'If admin is logged in ' do
    login_user(true)

    it 'should show the new category path', js: false do
      save_and_open_page
      expect(page).to have_content('Új webáruház kategória')
    end
  end
end
