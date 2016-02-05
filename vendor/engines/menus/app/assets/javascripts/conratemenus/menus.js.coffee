class Conratemenu
  menuabletypes = new Object()
  default_type = ""
  default_id = ""

  constructor: () ->

  setTargetTypes: (select1, select2, locale, _default_type, _default_id) ->
    default_type = _default_type
    default_id = _default_id
    select1.empty()
    select2.empty()
    t = this
    $.get('/conratemenus/menuabletypes.json?locale=' + locale , (data) ->
      select1[0].options.add(new Option('', ''))
      $.each(data, (index, elem) ->
        menuabletypes[elem[2]] = elem[1]

        select1[0].options.add(new Option(elem[0], elem[2]))
      )
      select1.val(default_type)
      t.setTargetIDs($('#menus_menu_menuable_id'), default_type, true)
      $('#menu_menuable_type').change();
    )

  setTargetIDs: (select, value, set_default) ->
    if select[0] != undefined
      first = true
      select.empty()
      select[0].options.add(new Option('', ''))
      url = menuabletypes[value]
      if value!=''
        $.get(url, (response) ->
          type = response[0]
          data = response[1]
          $.each(data, (index, elem) ->
            if first
              select.empty()
              first = false
            select[0].options.add(new Option(elem.title, elem.id))
          )
          if set_default == true
            select.val(default_id)
        )

$(document).ready(()-> 
  window.conratemenu = new Conratemenu
)
