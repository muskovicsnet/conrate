# encoding: utf-8
module RequestMacros
  def login_admin
    before(:each) do

    end
  end

  def login_user(allow_transfer = false)
    before(:each) do
      @user = create :user
      get new_user_session_path
      expect(response).to have_http_status(200)
      post new_user_session_path, user: {email: @user.email, password: 'adminadmin'}
      expect(response).to redirect_to(home_path)
      follow_redirect!
      expect(response).to have_http_status(200)
    end
  end
end
