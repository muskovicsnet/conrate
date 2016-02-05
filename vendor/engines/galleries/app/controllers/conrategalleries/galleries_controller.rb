module Conrategalleries
  class GalleriesController < ApplicationController
    include Flip::ControllerFilters
    require_feature :conrate_galleries

    helper Btemplater::ApplicationHelper
    helper Btemplater::IndexHelper
    helper Btemplater::ShowHelper
    helper Btemplater::NewHelper
    helper Btemplater::EditHelper
    include Btemplater::Tools

    def show
      @obj = Conrategalleries::Gallery.find(params[:id])
      @photos = @obj.photos.order('ordernum')
    end

    def new
      @obj = Conrategalleries::Gallery.new
    end

    def create
      do_create(params, Conrategalleries::Gallery, main_app.home_path)
    end

    def edit
      @obj = Conrategalleries::Gallery.find(params[:id])
    end

    def update
      do_update(params, Conrategalleries::Gallery)
    end

    def destroy
      do_destroy(params, Conrategalleries::Gallery, main_app.home_path)
    end

    def listformenu
      authorize Conrategalleries::Gallery, :listformenu?
      @galleries = GalleryPolicy::Scope.new(current_user, Conrategalleries::Gallery).listformenu

      respond_to do |format|
        format.json { render json: ['Conrategalleries::Gallery', @galleries.map{|w| {id: w.id, title: w.title}}]}
      end
    end

    def save_order
      #TODO: auth
      authorize Conrategalleries::Gallery, :save_order?
      order = params[:order]
      order.each_with_index do |id, i|
        photo = Conrategalleries::Photo.find(id)
        photo.ordernum = i
        photo.save!
      end
    end
  end
end
