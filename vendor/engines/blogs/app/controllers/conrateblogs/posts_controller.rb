module Conrateblogs
  class PostsController < ApplicationController
    helper Btemplater::ApplicationHelper
    helper Btemplater::IndexHelper
    helper Btemplater::ShowHelper
    helper Btemplater::NewHelper
    helper Btemplater::EditHelper
    include Btemplater::Tools

    def show
      @obj = Conrateblogs::Post.find(params[:id])
      raise Pundit::NotAuthorizedError unless(Conrateblogs::PostPolicy.new(Btemplater::Engine.config.current_user_entity.call(self), @obj).show?)
      @blog = @obj.blog
    end

    def new
      @obj = Conrateblogs::Post.new
      raise Pundit::NotAuthorizedError unless(Conrateblogs::PostPolicy.new(Btemplater::Engine.config.current_user_entity.call(self), @obj).new?)
      @obj.blog_id = params[:blog_id]
    end

    def create
      do_create(params, Conrateblogs::Post, conrateblogs.blog_path(params[:blog_id]))
    end

    def edit
      @obj = Conrateblogs::Post.find(params[:id])
      raise Pundit::NotAuthorizedError unless(Conrateblogs::PostPolicy.new(Btemplater::Engine.config.current_user_entity.call(self), @obj).edit?)
    end

    def update
      do_update(params, Conrateblogs::Post, conrateblogs.blog_path(params[:blog_id]))
    end

    def before_save_create(obj)
      obj.blog_id = params[:blog_id]
    end

    def destroy
      do_destroy(params, Conrateblogs::Post, conrateblogs.blog_path(params[:blog_id]))
    end
  end
end
