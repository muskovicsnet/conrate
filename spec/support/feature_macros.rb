# encoding: utf-8

include Warden::Test::Helpers
Warden.test_mode!

module FeatureMacros
  def login_user(admin = false)
    before(:each) do
      @user = create :user
      @user.add_role(:conratesecurity_admin) if admin
      visit conratesecurity.new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_button 'Belépés'
    end
  end
end
