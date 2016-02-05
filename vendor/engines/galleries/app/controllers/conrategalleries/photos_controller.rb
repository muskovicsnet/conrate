module Conrategalleries
  class PhotosController < ::Conrategalleries::ApplicationController
    include Flip::ControllerFilters
    require_feature :conrate_galleries

    helper Btemplater::ApplicationHelper
    helper Btemplater::IndexHelper
    helper Btemplater::ShowHelper
    helper Btemplater::NewHelper
    helper Btemplater::EditHelper
    include Btemplater::Tools

    def create
      # TODO: auth
      gallery = Conrategalleries::Gallery.find(params[:gallery_id])
      @photo = Conrategalleries::Photo.new(photo_params)
      @photo.gallery_id = gallery.id

      authorize @photo, :create?

      respond_to do |format|
        if @photo.save
          format.js {}
        else
          format.js {}
        end
      end
      #byebug
    end

    def update
      @photo = Conrategalleries::Photo.find(params[:id])

      authorize @photo, :update?

      respond_to do |format|
        if @photo.update_attributes(params.require(:photo).permit(Conrategalleries::PhotoPolicy.new(current_user, @photo).permitted_attributes))
          format.html { redirect_to(@photo, :notice => 'Photo was successfully updated.') }
          format.json { respond_with_bip(@photo) }
        else
          format.html { render :action => "edit" }
          format.json { respond_with_bip(@photo) }
        end
      end
    end

    def destroy
      @delete_id = params[:id]
      photo = Conrategalleries::Photo.find(@delete_id)

      authorize photo, :destroy?

      photo.destroy
    end

    private

    def photo_params
      params.require(:photo).permit(:title, :file)
    end
  end
end
