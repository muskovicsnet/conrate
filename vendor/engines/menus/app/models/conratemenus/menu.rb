module Conratemenus
  class Menu < ActiveRecord::Base
    include TheSortableTree::Scopes
    include Rails.application.routes.url_helpers

    acts_as_nested_set

    belongs_to :menuable, polymorphic: true

    validates_presence_of :title
    validate :menuable_is_correct

    def my_title
      translateable ? I18n.t('conratemenus.menus.index.' + title) : title
    end

    def self.my_title_s(title, translateable)
      translateable ? I18n.t('conratemenus.menus.index.' + title) : title
    end

    def menuable_is_correct
      unless (menuable_type.blank? && menuable_id.blank?) || (!menuable_type.blank? && !menuable_id.blank?)
        errors.add(:menuable_type, I18n.t('conratemenus.update.if_field_not_empty'))
        errors.add(:menuable_id, I18n.t('conratemenus.update.this_field_cant_be_empty'))
      end
    end

    def get_path(h)
      url = ''
      begin
        if menuable.has_attribute?(:parseable) && menuable.parseable
          # TODO: HACK
          # We take the first part ex: swxpicture.galleries_path => swxpicture
          first = menuable.href.split('.')[0].to_sym
          engine = ''
          begin
            engine = h.controller_path.split('/').first if h.controller_path.split('/').size > 1
          rescue Exception => ee
          end
          if first != :main_app && (first.to_s != engine.to_s) && engine != ''
            # We take the URL from this part
            url  = eval("h.#{menuable.href}").split(engine.to_s).last
          else
            url = eval("h.#{menuable.href}")
          end
        else
          # url  = menuable.href(h.params.merge(:locale => h.locale))
          # TODO: is it safe?
          myparams = h.params
          myparams.delete :controller
          myparams.delete :action
          myparams.delete :id
          url = h.send(menuable.class.name.deconstantize.downcase).url_for([menuable, myparams])
        end
      rescue Exception => e
        # byebug
      end
      return url
    end
  end
end
