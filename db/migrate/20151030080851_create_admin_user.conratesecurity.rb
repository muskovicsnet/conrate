# This migration comes from conratesecurity (originally 20151030080627)
class CreateAdminUser < ActiveRecord::Migration
  def up
    admin = Conratesecurity::User.new(
      username: 'admin',
      email: 'admin@muskovics.net',
      password: 'adminadmin',
      password_confirmation: 'adminadmin',
      confirmed_at: Time.now
    )
    admin_role = Conratesecurity::Role.find_or_create_by(name: :conratesecurity_admin, role_type: 'SYSTEM')
    admin.roles << admin_role
    admin.save!
  end

  def down
    Conratesecurity::User.find_by_email('admin@muskovics.net').destroy
  end
end
