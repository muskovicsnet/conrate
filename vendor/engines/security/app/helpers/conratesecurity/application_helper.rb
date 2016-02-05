module Conratesecurity
  module ApplicationHelper
    def self.create_role(find_options, create_options)
      role = Role.where(find_options)
      unless role.any?
        role = Role.create!(create_options)
      else
        role = role.first
      end
      return role
    end

    def self.create_or_get_admin_user
      admin = User.find_by_username('admin')
      if admin.nil?
        admin = User.new(username: 'admin', email: 'admin@muskovics.net', password: 'adminadmin', password_confirmation: 'adminadmin')
        admin.skip_confirmation!
        admin.save!
      end
      return admin
    end

    def self.add_role_to_admin(role)
      admin = ApplicationHelper.create_or_get_admin_user
      admin_roles = admin.roles
      unless admin_roles.include? role
        admin.roles << role
      end
      admin.save!
    end

    def self.create_default_roles
      admin_role = ApplicationHelper.create_or_get_system_role('conratesecurity-admin')
      add_role_to_admin(admin_role)
      user_role = ApplicationHelper.create_or_get_system_role('conratesecurity-user')
      # customer_role = ApplicationHelper.create_or_get_system_role('conratesecurity-customer')
      # company_role = ApplicationHelper.create_or_get_system_role('conratesecurity-company')
    end

    def self.create_or_get_system_role(name)
      Role.find_or_create_by!(name: name, role_type: 'SYSTEM')
    end
  end
end
