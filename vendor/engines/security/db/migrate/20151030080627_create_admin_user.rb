class CreateAdminUser < ActiveRecord::Migration
  def up
    admin = Conratesecurity::User.new(
      username: 'admin',
      email: 'admin@muskovics.net',
      password: 'adminadmin',
      password_confirmation: 'adminadmin',
      confirmed_at: Time.now
    )
    admin.add_role :conratesecurity_admin
  end

  def down
    Conratesecurity::User.find_by_email('admin@muskovics.net').destroy
  end
end
