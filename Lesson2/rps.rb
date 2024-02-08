require 'yaml'

MESSAGES = YAML.load_file 'rps_messages.yml'
MOVES = {
  rock: { inputs: %w[r rock], beats: %i[scissors] },
  paper: { inputs: %w[p paper], beats: %i[rock] },
  scissors: { inputs: %w[s scissors], beats: %i[paper] }
}
MOVES.freeze

def display_message (key, *args)
  message = (args.empty? ? MESSAGES[key] : MESSAGES[key] % args)
  prompt message
end

def prompt(string)
  puts ">> #{string}"
end

def player_choice
  choice = nil
  loop do
    display_message 'choose', MOVES.keys.join(', ')
    input = gets.chomp.downcase
    choice = get_valid_choice input
    break if choice

    display_message 'invalid'
  end
  choice
end

def get_valid_choice(string)
  valid = nil
  valid = :rock if MOVES[:rock][:inputs].include? string
  valid = :paper if MOVES[:paper][:inputs].include? string
  valid = :scissors if MOVES[:scissors][:inputs].include? string
  valid
end

def display_winner(player_win, computer_win)
  message = "It's a tie!"
  message = 'You won!' if player_win
  message = 'The computer won!' if computer_win
  prompt message
end

def score(win)
  win ? 1 : 0
end

def display_score(player_score, computer_score)
  display_message 'see_score'
  see_score = gets.chomp.downcase
  return unless see_score.start_with? 'y'

  prompt "Player: #{player_score}"
  prompt "Computer: #{computer_score}"
end

player_score = 0
computer_score = 0
loop do
  choice = player_choice
  computer_choice = MOVES.keys.sample

  display_message 'choices', choice, computer_choice

  player_win = MOVES[choice][:beats].include? computer_choice
  computer_win = MOVES[computer_choice][:beats].include? choice

  display_winner player_win, computer_win
  player_score += score player_win
  computer_score += score computer_win

  display_score player_score, computer_score

  display_message 'play_again'
  play_again = gets.chomp.downcase

  break unless play_again.start_with? 'y'
end
