require './menu.rb'
require './genre.rb'


def genres
  [ Genres.new(id:1, name: "ピザ"),
    Genres.new(id:2, name: "丼物"),
    Genres.new(id:3, name: "麺類")
  ]
end

def menus
  [
    Menus.new(id:4, name: "マルゲリータ", price: 500, time: 30, genre: "ピザ"),
    Menus.new(id:5, name: "ビスマルク", price: 600, time: 30, genre: "ピザ"),
    Menus.new(id:6, name: "クアトロフォルマッジ", price: 650, time: 30, genre: "ピザ"),
    Menus.new(id:7, name: "牛丼", price: 350, time: 25, genre: "丼物"),
    Menus.new(id:8, name: "天丼", price: 600, time: 35, genre: "丼物"),
    Menus.new(id:9, name: "カツ丼", price: 650, time: 35, genre: "丼物"),
    Menus.new(id:10, name: "ラーメン", price: 400, time: 20, genre: "麺類"),
    Menus.new(id:11, name: "ざるそば", price: 350, time: 20, genre: "麺類"),
    Menus.new(id:12, name: "わかめうどん", price: 380, time: 20, genre: "麺類"),
  ]
end

# ジャンル選択
def select_genre
  puts "ジャンル一覧"
  puts "-----------------------------------"
  genres.each do |genre|
    puts "番号:#{genre.id} #{genre.name}"
  end
  puts "-----------------------------------"
  puts "番号を選択してください（半角数字）"
  loop {
    $choice_genre = gets.to_i
    #変数に値が入っているか確認
    if $choice_genre ==1 or $choice_genre ==2 or $choice_genre ==3
      break
    else
      puts "もう一度番号を選択してください（半角数字）"
    end
  }
end


# メニュー選択
def select_menu
  puts "-----------------------------------"
  if $choice_genre == 1 
    menus.each do |menu|
      puts "番号:#{menu.id} #{menu.name}　#{menu.price}円  お届け時間#{menu.time}分"
    end  
  elsif $choice_genre == 2
    puts "2"
    menus.slice(3..5).each do |menu|
      puts "番号:#{menu.id} #{menu.name}　#{menu.price}円  お届け時間#{menu.time}分"
    end      
  else $choice_genru == 3
    menus.slice(6..8).each do |menu|
      puts "番号:#{menu.id} #{menu.name}　#{menu.price}円  お届け時間#{menu.time}分"
    end
  end
  puts "-----------------------------------"
  puts "商品番号を選択してください（半角数字）"

  loop {
    # 商品名を受け取る
    $choice_menu = gets.to_i

    $choice_menu = menus.find {|menu| menu.id == $choice_menu}

    # 変数に値が入っているか確認
    if $choice_menu .nil?
      puts "その商品はありません。"  
      puts "もう一度選んでください。（半角数字）"
    else
      puts "お会計 : #{$choice_menu.price}円"
      puts "お支払い方法を入力してください（現金 or クレジットカード）"
      break
    end
  }
end


def select_how_to_pay
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
  puts "お届け先の郵便番号をご入力ください。（入力形式○○○-○○○○/半角数字で記入）"
  loop { 
    #半角数字７桁以外は、エラーを表示する。
    address = gets.chomp

    if address.match(/\d{3}-\d{4}/)
      puts "入力が完了しました。"
      puts "ご注文ありがとうございました。"
      puts "#{Time.now}に注文が完了しました。"
      puts "#{$choice_menu.time}分前後でお届けいたします。"
      break
    else
      puts "エラーです。郵便番号を入力してください。（入力形式○○○-○○○○/半角数字で記入）"
    end 
  } 
end