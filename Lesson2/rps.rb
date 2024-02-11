require 'yaml'

LANGUAGE = 'en' # Only supports enlish at the moment.
MESSAGES = YAML.load_file 'rps_messages.yml'

# If extended moves are used, they are combined with standard moves, so standard
# moves needs the extended moves win logic
STANDARD_MOVES = {
  rock: { inputs: MESSAGES[LANGUAGE]['rock_inputs'], beats: %i[scissors lizard] },
  paper: { inputs: MESSAGES[LANGUAGE]['paper_inputs'], beats: %i[rock spock] },
  scissors: { inputs: MESSAGES[LANGUAGE]['scissors_inputs'], beats: %i[paper lizard] }
}
EXTENDED_MOVES = {
  lizard: { inputs: MESSAGES[LANGUAGE]['lizard_inputs'], beats: %i[paper spock] },
  spock: { inputs: MESSAGES[LANGUAGE]['spock_inputs'], beats: %i[rock scissors] }
}

def display_message(key, *args)
  prompt message(key, *args)
end

def message(key, *args)
  args.empty? ? MESSAGES[LANGUAGE][key] : MESSAGES[LANGUAGE][key] % args
end

def prompt(string)
  puts ">> #{string}"
end

def clear_screen
  system 'clear'
end

def display_move_choices
  # Too long for a ternary
  move_prompt = if MOVES.length > STANDARD_MOVES.length
                  message 'extended_moves'
                else
                  message 'moves'
                end
  display_message('choose', move_prompt)
end

def input_choice
  move = nil
  loop do
    display_move_choices
    input = gets.chomp.downcase
    move = to_move(input)
    break if move

    clear_screen
    display_message 'invalid'
  end
  move
end

def to_move(string)
  move = nil
  MOVES.each { |k, v| move = k if v[:inputs].include? string }
  move
end

def display_winner(player_win, computer_win)
  message = 'tie'
  message = 'win' if player_win
  message = 'lose' if computer_win
  display_message message
end

def display_score(player_score, computer_score)
  display_message 'see_score'
  return unless confirmation?

  display_message('player_score', player_score)
  display_message('computer_score', computer_score)
end

def confirmation?
  input = gets.chomp.downcase
  input.start_with? message('confirm_character') # English character is 'y'
end

player_score = 0
computer_score = 0
extended_rules = false

clear_screen
display_message 'welcome'
display_message 'extended?'
extended_rules = true if confirmation?

display_message 'see_rules'
if confirmation?
  display_message(extended_rules ? 'extended_rules' : 'rules')
end

MOVES = extended_rules ? STANDARD_MOVES.merge(EXTENDED_MOVES) : STANDARD_MOVES

display_message 'ready'
# Await player input only
gets

loop do
  clear_screen
  player_choice = input_choice
  computer_choice = MOVES.keys.sample

  display_message 'choices', player_choice, computer_choice

  player_win = MOVES[player_choice][:beats].include? computer_choice
  computer_win = MOVES[computer_choice][:beats].include? player_choice

  display_winner player_win, computer_win
  player_score += player_win ? 1 : 0
  computer_score += computer_win ? 1 : 0

  display_score player_score, computer_score

  display_message 'play_again'
  break unless confirmation?
end

clear_screen
display_message 'thanks'
display_message 'goodbye'
