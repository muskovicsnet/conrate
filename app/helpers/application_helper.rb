module ApplicationHelper
  def main_menu
    @menus = Conratemenus::Menu.find_by_title('conratemenus-mainmenu').descendants.order('lft ASC, rgt ASC, id ASC')

    out = nested_li(@menus) do |menu|
      if menu.children.count > 0
        if menu.depth == 1
          link_to menu.get_path(self), class: 'dropdown-toggle', 'data-toggle': 'dropdown' do
            "#{menu.title} <b class=\"caret\"></b>".html_safe
          end
        else
          link_to menu.get_path(self), class: 'dropdown-toggle', 'data-toggle': 'dropdown' do
            "#{menu.title}".html_safe
          end
        end
      else
        link_to menu.title, menu.get_path(self)
      end
    end
    out
  end

  def nested_li(objects, &block)
    objects = objects.order(:lft, :rgt, :id) if objects.is_a? Class

    return '' if objects.size == 0

    output = ''
    path = []

    ul_class = 'nav navbar-nav'
    objects.each_with_index do |o, i|
      if o.parent_id != path.last
        # We are on a new level, did we descend or ascend?
        if path.include?(o.parent_id)
          # Remove the wrong trailing path elements
          while path.last != o.parent_id
            path.pop
            output << '</li></ul>'
          end
          li_class = ''
          li_class = 'dropdown-submenu' if o.children.count > 0 && o.depth != 1
          output << "</li><li class=\"#{li_class}\">"
        else
          path << o.parent_id
          li_class = ''
          li_class = 'dropdown-submenu' if o.children.count > 0 && o.depth != 1
          output << "<ul class=\"#{ul_class}\"><li class=\"#{li_class}\">"
          ul_class = 'dropdown-menu'
          ul_class += ' multi-level' if o.depth == 1
        end
      elsif i != 0
        li_class = ''
        li_class = 'dropdown-submenu' if o.children.count > 0 && o.depth != 1
        output << "</li><li class=\"#{li_class}\">"
      end
      output << capture(o, path.size - 1, &block)
    end

    output << '</li></ul>' * path.length
    output.html_safe
  end

  def sorted_nested_li(objects, order, &block)
    nested_li sort_list(objects, order), &block
  end

  private

  def sort_list(objects, order)
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

  def recombine_lists(results, children_of, parent_id)
    if children_of[parent_id]
      children_of[parent_id].each do |o|
        results << o
        recombine_lists(results, children_of, o.id)
      end
    end
  end

  def do_ul(n, menus)
    str = ''
    str += '<ul class="dropdown-menu">' unless n == 1
    str += do_nth_level(n, menus)
    str += '</ul>' unless n == 1
    return str
  end

  def do_nth_level(n, menus)
    str = ''
    menus.each do |m|
      str += render_li(m) if m.level == n
    end
    str += do_ul(n+1, menus) if n < 4
    return str
  end

  def render_li(menu)
    str = ''
    str += '<li class="dropdown">' + link_to(menu.title, menu.get_path(self), class: 'dropdown-toggle', 'data-toggle': 'dropdown')
    str += '</li>'
    str
  end

  def footer_menu
    capture do
      menu = Conratemenus::Menu.find_by_title('conratemenus-footermenu')
      menu.children.each do |menu|
        concat content_tag(:li, link_to(menu.title, menu.get_path(self)))
      end unless menu.nil?
    end
  end

  def user_menu
    capture do
      menu = Conratemenus::Menu.find_by_title('conratemenus-usermenu')
      menu.children.each do |menu|
        concat content_tag(:li, link_to(menu.title, menu.get_path(self)))
      end unless menu.nil?
    end
  end

  def admin_menu
    navigation "nav", attributes: {class: 'nav nav-pills nav-stacked'} do
      if Flip.conrate_blogs?
        li nil do
          a t('conrateblogs.sidebar.blogs'), attributes: { href: conrateblogs.new_blog_path }
          ul nil, attributes: { class: "nav nav-pills nav-stacked", role: 'presentation' } do
            Conrateblogs::Blog.all.each do |blog|
              item blog.title, conrateblogs.blog_path(blog)
            end
          end
        end
      end
      if Flip.conrate_pages?
        li nil do
          a t('conratepages.sidebar.pages'), attributes: { href: conratepages.new_page_path }
          ul nil, attributes: { class: "nav nav-pills nav-stacked", role: 'presentation' } do
            Conratepages::Page.all.each do |page|
              item page.title, conratepages.page_path(page)
            end
          end
        end
      end
      if Flip.conrate_galleries?
        li nil do
          a t('conrategalleries.sidebar.galleries'), attributes: { href: conrategalleries.new_gallery_path }
          ul nil, attributes: { class: "nav nav-pills nav-stacked", role: 'presentation' } do
            Conrategalleries::Gallery.all.each do |gallery|
              item gallery.title, conrategalleries.gallery_path(gallery)
            end
          end
        end
      end
      if Flip.conrate_webshop?
        categories = Conratewebshop::Category.each_with_level(Conratewebshop::Category.root.descendants) { |category, level| }
        li nil, attributes: {class: 'conratewebshop-admin-categories'} do
          a t('conratewebshop.sidebar.categories'), attributes: { href: conratewebshop.new_category_path }
          ul nil, attributes: { class: "nav nav-pills nav-stacked", role: 'presentation' } do
            categories.each do |category|
              item category.name, conratewebshop.category_path(category), item_attributes: {class: "level-#{category.level}"}
            end
          end
        end
        li nil do
          a t('conratewebshop.sidebar.orders'), attributes: { href: conratewebshop.orders_path }
        end
        li nil do
          a t('conratewebshop.sidebar.pricemanipulators'), attributes: { href: conratewebshop.pricemanipulators_path }
        end
      end
      li '<hr />'
      if Flip.conrate_menus?
        li nil do
          a t('conratemenus.sidebar.menus'), attributes: { href: conratemenus.menus_path }
        end
      end
      if Flip.conrate_security?
        li nil do
          a t('conratesecurity.sidebar.users'), attributes: { href: conratesecurity.users_path }
        end
        li nil do
          a t('conratesecurity.sidebar.roles'), attributes: { href: conratesecurity.roles_path }
        end
      end
      li '<hr />'
      if Flip.conrate_settings?
        li nil do
          a t('conratemenus.sidebar.settings'), attributes: { href: conratesettings.settings_path }
        end
      end
      if Flip.conrate_jobs?
        li nil do
          a t('conratemenus.sidebar.jobs'), attributes: { href: conratejobs.que_path, target: '_blank' }
        end
      end
      li nil do
        a t('conrateflip.sidebar.flip'), attributes: { href: conrate_flip.flip_path }
      end
    end
  end

  # TODO: ne ide!
  def render_box(title, elements)
    capture do
      content_tag(:div, class: 'box') do
        content_tag(:div, class: 'title_inner_block') do
           content_tag(:div, class: 'box-heading') do
            title
          end
        end +
        content_tag(:div, class: 'box-content left-category') do
          content_tag(:ul, class: 'box-category treeview-list treeview') do
            elements.each do |link|
              concat content_tag(:li, link)
            end
          end
        end
      end
    end
  end
end
