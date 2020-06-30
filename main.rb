require './genre.rb'
require "./shopcontroller.rb"

shopcontroller = ShopController.new

genre = shopcontroller.select_genre()

#メニューの選択
shopcontroller.select_menu(genre,menus)

# お支払い方法の選択
shopcontroller.select_how_to_pay

#住所の入力と注文完了のお知らせ
shopcontroller.imput_address
