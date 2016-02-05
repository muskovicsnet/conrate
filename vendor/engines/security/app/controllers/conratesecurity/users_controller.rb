module Conratesecurity
  class UsersController < ApplicationController
    # before_action :set_user, only: [:show, :edit, :update, :destroy]

    #include Flip::ControllerFilters
    #require_feature :conrate_security

    helper Btemplater::ApplicationHelper
    helper Btemplater::IndexHelper
    helper Btemplater::ShowHelper
    helper Btemplater::NewHelper
    helper Btemplater::EditHelper
    include Btemplater::Tools

    def index
      @objects = Conratesecurity::User.all.order('email asc').page(params[:page])
    end

    def new
      @obj = Conratesecurity::User.new
    end

    def create
      do_create(params, Conratesecurity::User, conratesecurity.users_path)
    end

    def edit
      @obj = Conratesecurity::User.find(params[:id])
    end

    def update
      do_update(params, Conratesecurity::User, conratesecurity.users_path)
    end

    def deactivate
      @user = Conratesecurity::User.find(params[:user_id])
      raise Pundit::NotAuthorizedError unless(Conratesecurity::UserPolicy.new(Btemplater::Engine.config.current_user_entity.call(self), @obj).deactivate?)
      if @user != current_user
        if @user.deactivated
          @user.deactivated = false
        else
          @user.deactivated = true
        end
        @user.save!
      end
      redirect_to conratesecurity.users_path(page: params[:page])
    end

    def destroy
      @obj = Conratesecurity::User.find(params[:id])
      @obj.destroy
      redirect_to conratesecurity.users_path
    end

    # GET/PATCH /users/:id/finish_signup
    def finish_signup
      # TODO: authorize! :update, @user
      @user = User.find(params[:id])

      if request.patch? && params[:user] #&& params[:user][:email]
        if @user.update(user_params)
          @user.skip_reconfirmation!
          sign_in(@user, :bypass => true)
          redirect_to @user, notice: 'Your profile was successfully updated.'
        else
          @show_errors = true
        end
      end
    end

    def social_sign_in
    end

    def after_save_create(obj)
      obj.confirm!
    end
  end
end
