module Conratemenus
  require 'pundit'

  class MenuabletypesController < ::Conratemenus::ApplicationController
    respond_to :json

    def index
      authorize Menuabletype, :index?

      @menuabletypes = policy_scope(Menuabletype)
      # .pagenumber(params[:pagenumber]).per(get_setting_value('appearance.rowperpage')).order(sort_column + ' ' + sort_direction)

      respond_with @menuabletypes.map { |m| [m.my_name, m.getelementspath, m.classname]  }
    end
  end
end
