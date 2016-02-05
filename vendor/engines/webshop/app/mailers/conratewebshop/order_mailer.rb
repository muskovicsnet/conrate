module Conratewebshop
  class OrderMailer < ApplicationMailer
    def order_email(user, order)
      @user = user
      @order = order
      mail(to: @user.email, subject: 'Visszaigazolás')
    end
  end
end
