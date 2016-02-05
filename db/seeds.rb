##### MENUS
puts "  * Conratemenus"
puts '   - mainmenu'
main_menu = Conratemenus::ApplicationHelper.create_menu({ title: 'conratemenus-mainmenu' }, { title: 'conratemenus-mainmenu', translateable: true, editable: false, locale_id: nil, cantmove: true}, nil, 10, '')
puts '   - usermenu'
user_menu = Conratemenus::ApplicationHelper.create_menu({ title: 'conratemenus-usermenu' }, { title: 'conratemenus-usermenu', translateable: true, editable: false, locale_id: nil, cantmove: true}, nil, 50, '')
puts '   - footermenu'
footer_menu = Conratemenus::ApplicationHelper.create_menu({ title: 'conratemenus-footermenu' }, { title: 'conratemenus-footermenu', translateable: true, editable: false, locale_id: nil, cantmove: true}, nil, 90, '')
