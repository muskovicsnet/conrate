module Conratemenus
  module ApplicationHelper
    #
    # Returns the menu hierarchy.
    def self.get_menu_tree
      @menus = Conratemenus::Menu.nested_set_scope.select('id, title, translateable, parent_id, cantmove, editable').all
    end

    #
    # Finds the menu with find_options and returns. If it is nil creates
    # with create_options. In all case sets the parent menu to parent if
    # parent is nil.
    #
    def self.create_menu(find_options, create_options, parent = nil, relposition = 0, icon = '')
      menu = Conratemenus::Menu.where(find_options)
      unless menu.any?
        menu = Conratemenus::Menu.create!(create_options)
        menu.relposition = relposition
        menu.icon = icon
        menu.save!
        if (!parent.nil? && menu.parent.nil?)
          menu.parent = parent
          menu.save!
        end
        Conratemenus::MenusHelper.reorder_by_relposition
      else
        menu = menu.first
      end
      return menu
    end

    #
    # Finds the url with find_options and return. If it is nil creates
    # with create_options. In all cases sets the parent if it is nil.
    #
    def self.create_url(find_options, create_options, parent = nil)
      url = Conratemenus::Url.where(find_options)
      unless url.any?
        url = Conratemenus::Url.create!(create_options)
      else
        url = url.first
      end
      if (!parent.nil? && url.menu.nil?)
        url.menu = parent
        parent.menuable = url
        url.save!
        parent.save!
      end
      return url
    end

    #
    # Finds the menu with menu_find_options. If it is nil creates
    # with menu_create_options. In all case sets the parent menu to
    # parent if parent is nil.
    # Finds the url with url_find_options and return. If it is nil creates
    # with url_create_options.
    # Sets the url's menu to the menu and creates an acl to the Url.
    #
    def self.create_menu_full(
        menu_find_options,
        menu_create_options,
        parent_menu,
        url_find_options,
        url_create_options,
        relposition = 0,
      icon = '')
      # Create menu
      menu = Conratemenus::ApplicationHelper.create_menu(
        menu_find_options,
        menu_create_options,
        parent_menu,
        relposition,
      icon)
      # Set url
      menu_url = Conratemenus::ApplicationHelper.create_url(url_find_options, url_create_options, menu)
      # Create role
      role_find_options = { name: menu.title }
      role_create_options = { name: menu.title, role_type: 'SYSTEM' }
      menu_role = Conratesecurity::ApplicationHelper.create_role(role_find_options, role_create_options)
      Conratesecurity::ApplicationHelper.add_role_to_admin(menu_role)
      # Create acl
      menuacl = Conratesecurity::Acl.new
      menuacl.role = menu_role
      menuacl.access_type = Conratesecurity::Acl.access_type.menu
      menuacl.aclable = menu_url
      menuacl.save!
    end

    #
    # Creates or gets the adminmenu
    #
    def self.create_or_get_adminmenu
      Conratemenus::ApplicationHelper.create_menu(
        {
          title: 'conratemenus-adminmenu'
        },
        {
          title: 'conratemenus-adminmenu',
          translateable: true,
          editable: false,
          locale_id: nil,
          cantmove: true
        }
      )
    end

    def self.create_or_get_contentsmenu
      Conratemenus::ApplicationHelper.create_menu(
        {
          title: 'conratemenus-contentsmenu'
        },
        {
          title: 'conratemenus-contentsmenu',
          translateable: true,
          editable: false,
          locale_id: nil,
          cantmove: true
        },
        self.create_or_get_adminmenu,
        10,
        'glyphicon glyphicon-file'
      )
    end

    def self.create_or_get_commercemenu
      Conratemenus::ApplicationHelper.create_menu(
        {
          title: 'conratemenus-commercemenu'
        },
        {
          title: 'conratemenus-commercemenu',
          translateable: true,
          editable: false,
          locale_id: nil,
          cantmove: true
        },
        self.create_or_get_adminmenu,
        20,
        'glyphicon glyphicon-file'
      )
    end

    def self.create_or_get_projectsmenu
      Conratemenus::ApplicationHelper.create_menu(
        {
        title: 'conratemenus-projectsmenu' },
        {
          title: 'conratemenus-projectsmenu',
          translateable: true,
          editable: false,
          locale_id: nil,
          cantmove: true
        },
        self.create_or_get_adminmenu,
        30,
        'glyphicon glyphicon-file'
      )
    end

    def self.create_or_get_systemmenu
      Conratemenus::ApplicationHelper.create_menu(
        {
          title: 'conratemenus-systemmenu'
        },
        {
          title: 'conratemenus-systemmenu',
          translateable: true,
          editable: false,
          locale_id: nil,
          cantmove: true
        },
        self.create_or_get_adminmenu,
        70,
        'glyphicon glyphicon-file'
      )
    end

    private

    #
    # Sets the menu's parent to parent_menu.
    #
    def self.move_to_child_of(menu, parent_menu)
      menu.move_to_child_of(parent_menu) if menu.parent_id != parent_menu.id
    end

    def self.sorted_nested_li(objects, order, &block)
      nested_li sort_list(objects, order), &block
    end

    private

    def self.sort_list(objects, order)
      objects = objects.order(:lft) if objects.is_a? Class

      # Partition the results
      children_of = {}
      objects.each do |o|
        children_of[ o.parent_id ] ||= []
        children_of[ o.parent_id ] << o
      end

      # Sort each sub-list individually
      children_of.each_value do |children|
        children.sort_by! &order
      end

      # Re-join them into a single list
      results = []
      recombine_lists(results, children_of, nil)

      results
    end

    def self.recombine_lists(results, children_of, parent_id)
      if children_of[parent_id]
        children_of[parent_id].each do |o|
          results << o
          recombine_lists(results, children_of, o.id)
        end
      end
    end

    def self.nested_li(objects, &block)
      objects = objects.order(:lft) if objects.is_a? Class

      return '' if objects.size == 0

      output = '<ul><li>'
      path = [nil]

      objects.each_with_index do |o, i|
        if o.parent_id != path.last
          # We are on a new level, did we descend or ascend?
          if path.include?(o.parent_id)
            # Remove the wrong trailing path elements
            while path.last != o.parent_id
              path.pop
              output << '</li></ul>'
            end
            output << '</li><li>'
          else
            path << o.parent_id
            output << '<ul><li>'
          end
        elsif i != 0
          output << '</li><li>'
        end
        # output << capture(o, path.size - 1, &block)
        output << capture(o, &block)
      end

      output << '</li></ul>' * path.length
      output.html_safe
    end

    def self.adminmenu
      
    end
  end
end
