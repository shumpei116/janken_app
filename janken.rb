def janken
  jankens= ["グー","チョキ","パー",3]
  puts "0(グー)1(チョキ)2(パー)3(戦わない)"
  
  player_hand =gets.to_i
  program_hand = rand(3)
  
  if (0..2) === player_hand
    puts "ホイ！"
    puts "----------"
    puts "あなた：#{jankens[player_hand]}を出しました"
    puts "CP：#{jankens[program_hand]}を出しました"
    puts "----------"
  end
  
  if player_hand == program_hand
    $case_pattern = "drow" #引き分け
    puts "あいこで..."
    return true
  elsif player_hand == 0  && program_hand == 2  || 
        player_hand == 1  && program_hand == 0  || 
        player_hand == 2  && program_hand == 1
    $case_pattern = "lose" #プレイヤーの負け
    puts "CPの勝利！ CPのターン！"
    return false
  elsif player_hand == 0  && program_hand == 1  || 
        player_hand == 1  && program_hand == 2  || 
        player_hand == 2  && program_hand == 0
    $case_pattern = "win" #プレイヤーの勝ち
    puts "あなたの勝利！ あなたのターン!"
    return false
  elsif player_hand == 3 #戦わない
    puts "平和主義者！"
    return false
  else
    puts "初めからやり直して下さい"
    return false
  end
end

def a_hoi
  puts "あっちむいて..."
  puts "0(上)1(下)2(左)3(右)"
  choises = ["上","下","左","右"]
  
  player_direction = gets.to_i
  program_direction = rand(4)
  
  puts "ホイ！"

  if (0..3) === player_direction
    puts "----------"
    puts "あなた：#{choises[player_direction]}"
    puts "CP：#{choises[program_direction]}"
    puts "----------"
  else
    puts "もう一度やり直してください"
    return
  end

  if player_direction == program_direction
    result = 0
  else
    result = 1
  end
    
  case $case_pattern
    when "win"
      if result == 0
        puts "あなたの勝利！！！"
        $endressgame = false
      elsif result == 1
        puts "もう一回！"
        $endressgame = true
      end
    when "lose"
      if result == 0
        puts "CPの勝利！！！"
        $endressgame = false
      elsif result == 1
        puts "もう一回！"
        $endressgame = true
      end
  end
end
  

$endressgame = true

while $endressgame do
  next_janken = true
  
  puts "じゃんけん..."
  
  while next_janken do
    next_janken = janken
  end
  
  case $case_pattern
    when "win","lose"
      a_hoi
      $case_pattern = nil
    else
      return
  end
end