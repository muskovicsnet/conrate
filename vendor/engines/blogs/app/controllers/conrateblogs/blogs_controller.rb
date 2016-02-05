module Conrateblogs
  class BlogsController < ApplicationController
    helper Btemplater::ApplicationHelper
    helper Btemplater::IndexHelper
    helper Btemplater::ShowHelper
    helper Btemplater::NewHelper
    helper Btemplater::EditHelper
    include Btemplater::Tools

    def show
      @obj = Conrateblogs::Blog.find(params[:id])
    end

    def new
      @obj = Conrateblogs::Blog.new
    end

    def create
      do_create(params, Conrateblogs::Blog, main_app.home_path)
    end

    def edit
      @obj = Conrateblogs::Blog.find(params[:id])
    end

    def update
      do_update(params, Conrateblogs::Blog)
    end

    def destroy
      do_destroy(params, Conrateblogs::Blog, main_app.home_path)
    end

    def listformenu
      authorize Conrateblogs::Blog, :listformenu?
      @categories = BlogPolicy::Scope.new(current_user, Conrateblogs::Blog).listformenu

      respond_to do |format|
        format.json { render json: ['Conrateblogs::Blog', @categories.map{|w| {id: w.id, title: w.title}}]}
      end
    end
  end
end
