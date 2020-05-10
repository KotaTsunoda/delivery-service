require './menu.rb'
require './genre.rb'


def selecting
  [
  Genres.new(id:1, name: "ピザ"),
  Genres.new(id:2, name: "丼物"),
  Genres.new(id:3, name: "麺類")
  ]
end

def products
  [
  Menus.new(id:4, name: "マルゲリータ", price: 500, time: 30),
  Menus.new(id:5, name: "ビスマルク", price: 600, time: 30),
  Menus.new(id:6, name: "クアトロフォルマッジ", price: 650, time: 30),
  Menus.new(id:7, name: "牛丼", price: 350, time: 25),
  Menus.new(id:8, name: "天丼", price: 600, time: 35),
  Menus.new(id:9, name: "カツ丼", price: 650, time: 35),
  Menus.new(id:10, name: "ラーメン", price: 400, time: 20),
  Menus.new(id:11, name: "ざるそば", price: 350, time: 20),
  Menus.new(id:12, name: "わかめうどん", price: 380, time: 20),
  ]
end

# 商品を配列にまとめる
def setting_foods(genres)
  @foods = genres
end

# ジャンル一覧
def selecting_list
  puts "ジャンル一覧"
  puts "-----------------------------------"
  @foods.each do |food|
    puts "番号:#{food.id} #{food.name}"
  end
  puts "-----------------------------------"
  puts "番号を選択してください"
end

# ジャンルを選んでそのジャンルが存在するか確認する。存在しない場合はもう一度選んでもらう
def search_food
  loop {
     
    @genru_id = gets.to_i

    @select_food = @foods.find {|food| food.id == @genru_id}

    #変数に値が入っているか確認
    if @select_food.nil?
      puts "もう一度番号を選択してください"
    else
      setting_menus(products)
      break
    end
  }
end


# メニューを配列にまとめる
def setting_menus(menus)
  @menus = menus
end

# メニュー一覧は、ジャンルで場合分け
def products_list
  puts "メニュー"
  puts "-----------------------------------"
  if @select_food.id == 1
    @menus.slice(0..2).each do |menu|
        puts "番号:#{menu.id} #{menu.name}　#{menu.price}円  お届け時間#{menu.time}分"
    end  
  elsif @select_food.id == 2
    puts "2"
    @menus.slice(3..5).each do |menu|
      puts "番号:#{menu.id} #{menu.name}　#{menu.price}円  お届け時間#{menu.time}分"
    end      
  else
    @menus.slice(6..8).each do |menu|
      puts "番号:#{menu.id} #{menu.name}　#{menu.price}円  お届け時間#{menu.time}分"
    end  
  end
     puts "-----------------------------------"
     puts "商品番号を選択してください"
end

# 商品を選んでその商品が存在するか確認する
def search_menu
  loop {
    # 商品名を受け取る
    @menu_id = gets.to_i

    @select_menu = @menus.find {|menu| menu.id == @menu_id}

    # 変数に値が入っているか確認
    if @select_menu.nil?
      puts "その商品はありません。"  
      puts "もう一度選んでください。"
    else
      puts "お会計 : #{@select_menu.price}円"
      puts "お支払い方法を入力してください（現金 or クレジットカード）"
      break
    end
  }
end

def checking
  loop { 
    #現金とクレジットカードは、エラーを表示する。
    how_to_pay = gets.chomp

    if how_to_pay == "現金" 
      puts ""
      break
    elsif how_to_pay == "クレジットカード" 
puts <<~TEXT 
クレジットカード情報を入力して下さい
＝＝＝＝＝（個人情報）＝＝＝＝＝
＝＝＝＝＝（入力中）＝＝＝＝＝
＝＝＝＝＝（入力中）＝＝＝＝＝
＝＝＝＝＝（入力中）＝＝＝＝＝
入力が完了しました。

支払い完了！！！    
TEXT
      break
    else
      puts "申し訳ございません。お支払いは現金かクレジットカード払いとなっております。"
    end 
  }
end

def imput_address
  puts "お届け先の郵便番号をご入力ください。（半角数字７桁。※ハイフン省略）"
  loop { 
    #半角数字７桁以外は、エラーを表示する。
    address = gets.chomp

    if address.size == 7 
      puts "入力が完了しました。"
      puts "ご注文ありがとうございました。"
      puts "#{Time.now}に注文が完了しました。"
      puts "#{@select_menu.time}分前後でお届けいたします。"
      break
    else
      puts "申し訳ございません。半角数字７桁で入力してください。※ハイフン省略"
    end 
  } 
end