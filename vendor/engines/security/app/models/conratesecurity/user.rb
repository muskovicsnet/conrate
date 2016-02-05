module Conratesecurity
  class User < ActiveRecord::Base
    TEMP_EMAIL_PREFIX = 'change@me'
    TEMP_EMAIL_REGEX = /\Achange@me/

    rolify :role_cname => 'Conratesecurity::Role'
    #rolify role_cname: 'Conratesecurity::Role', role_join_table_name: 'conrate_security_users_conrate_security_roles'

    has_many :orders, class_name: Pamer::Order
    has_many :addresses, class_name: Conrateaddressable::Address

    accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true

    # attr_accessor :login

    # validates :username,
    #   :presence => true,
    # :uniqueness => {
    #   :case_sensitive => false
    # }
    # validate :validate_username, on: :create
    validates :username, uniqueness: true
    validates_format_of :username, with: /\A[a-zA-Z0-9_\.]*\z/
    validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update
    validates_presence_of [:email, :username]
    # def validate_username
    #   if User.where(username: username).exists?
    #     errors.add(:username, :taken)
    #   end
    # end

    # def login=(login)
    #   @login = login
    # end

    # def login
    #   @login || self.username || self.email
    # end

    devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :trackable, :validatable,
      :confirmable, :lockable, :timeoutable, :omniauthable, :async

    def default_role(role)
      roles << Conratesecurity::Role.find_or_create_by(name: :conratesecurity_user, role_type: 'SYSTEM')
    end

    def pretty_name
      if username.blank?
        email.split('@').first
      else
        username
      end
    end

    # Login with username or e-mail
    # def self.find_for_database_authentication(warden_conditions)
    #   conditions = warden_conditions.dup
    #   if login = conditions.delete(:login)
    #     where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    #   else
    #     conditions[:email].downcase! if conditions[:email]
    #     if conditions[:username].nil?
    #       where(conditions).first
    #     else
    #       where(username: conditions[:username]).first
    #     end
    #   end
    # end

    def self.find_for_oauth(auth, signed_in_resource = nil)
      # Get the identity and user if they exist
      identity = Identity.find_for_oauth(auth)

      # If a signed_in_resource is provided it always overrides the existing user
      # to prevent the identity being locked with accidentally created accounts.
      # Note that this may leave zombie accounts (with no associated identity) which
      # can be cleaned up at a later date.
      user = signed_in_resource ? signed_in_resource : identity.user

      # Create the user if needed
      if user.nil?

        # Get the existing user by email if the provider gives us a verified email.
        # If no verified email was provided we assign a temporary email and ask the
        # user to verify it on the next step via UsersController.finish_signup
        email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
        email = auth.info.email if email_is_verified
        user = User.where(:email => email).first if email

        # Create the user if it's a new registration
        if user.nil?
          user = Conratesecurity::User.new(
            #username: auth.info.nickname || auth.uid,
            email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
            password: Devise.friendly_token[0,20]
          )
          user.skip_confirmation!
          user.save!
        end
      end

      # Associate the identity with the user if needed
      if identity.user != user
        identity.user = user
        identity.save!
      end
      user
    end

    def email_verified?
      self.email && self.email !~ TEMP_EMAIL_REGEX
    end

    def billing_address
      address = Conrateaddressable::Address.find_by(addresstype: Conrateaddressable::Address.addresstype.billing, user_id: id)
      if address.nil?
        address = Conrateaddressable::Address.new(addresstype: Conrateaddressable::Address.addresstype.billing)
      end
      return address
    end

    def delivery_address
      address = Conrateaddressable::Address.find_by(addresstype: Conrateaddressable::Address.addresstype.delivery, user_id: id)
      if address.nil?
        address = Conrateaddressable::Address.new(addresstype: Conrateaddressable::Address.addresstype.delivery)
      end
      return address
    end
  end
end
