module Conratemenus
  class MenusController < ApplicationController
    include TheSortableTreeController::Rebuild
    helper TheSortableTreeHelper

    helper Btemplater::ApplicationHelper
    helper Btemplater::IndexHelper
    helper Btemplater::ShowHelper
    helper Btemplater::NewHelper
    helper Btemplater::EditHelper
    include Btemplater::Tools

    def index
    end

    def new
      @obj = Conratemenus::Menu.new
    end

    def create
      do_create(params, Conratemenus::Menu, conratemenus.menus_path)
    end

    def edit
      @obj = Conratemenus::Menu.find(params[:id])
    end

    def update
      do_update(params, Conratemenus::Menu, conratemenus.menus_path)
    end

    # def manage
    #     @menus = Menu.nested_set.select('id, title, parent_id').all
    # end

    def destroy
      do_destroy(params, Conratemenus::Menu, conratemenus.menus_path)
    end

    def sortable_model
      Conratemenus::Menu
    end
  end
end
