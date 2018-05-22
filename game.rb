require './player.rb'
require './turn_taker.rb'

class Game

  def initialize
    player1 = Player.new('Mikaal')
    player2 = Player.new('Emily')
    @players = [player1,player2]

    @turn = TurnManager.new(@players)

  end

  def game_over?
    active_players.count == 1
  end

  def active_players
    @players.select { |p| !p.dead?}
  end

  def winner
    active_players.first
  end

  # puts @players.length

  def run

    # current_person = @turn.current_player
    puts summary
    while !game_over?
    # puts current_person
    current_person = @turn.current_player
    puts "#{current_person.name}, it's your turn"
    x = rand(20)
    y = rand(20)
    puts "What is #{x} + #{y}?"
    w = gets.chomp
    w2 = w.to_i
    z = x.to_i + y.to_i


    if (w2 == z)
      puts "Smart"
      puts ''
      @turn.next_turn
    else
      puts "Not smart!"
      puts ''
      current_person.wrong_answer
      sleep 0.4
    puts "#{current_person.name} HP #{current_person.health} "
    puts ''
    @turn.next_turn
    end

    sleep 0.5
  end
  the_winner = winner
  puts "#{the_winner.name} has won!"

end

  def summary
   summary = @players.map { |r| r.summary }.join("\n")

   """

----- SUMMARY -----
#{summary}
-------------------
   """
 end




end
