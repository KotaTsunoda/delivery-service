require './shopcontroller.rb'

shopcontroller = ShopController.new



# ジャンル選択
shopcontroller.select_genre

# メニュー選択
shopcontroller.select_menu(genre)

# お支払い方法の選択
shopcontroller.select_how_to_pay

#住所の入力と注文完了のお知らせ
shopcontroller.imput_address

