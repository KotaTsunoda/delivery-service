require './controller.rb'

# ジャンルを作成
genres = selecting

# ジャンルを配列にまとめる
setting_foods(selecting)

# ジャンル一覧
selecting_list

# ジャンルを選んでその商品が存在するか確認する（存在しない場合は、もう一度選択してもらう）
search_food

# メニューを作成
menus = products

# メニューを配列にまとめる
setting_menus(products)

# メニュー一覧
products_list

# メニュー番号を選んでその商品が存在するか確認する
search_menu

# お支払い方法の選択
checking

#住所の入力と注文完了のお知らせ
imput_address

