require 'yaml'

LANGUAGE = 'en' # Only supports enlish at the moment.
MESSAGES = YAML.load_file 'rps_messages.yml'

# If extended moves are used, they are combined with standard moves, so standard
# moves needs the extended moves win logic
STANDARD_MOVES = {
  rock: {
    inputs: MESSAGES[LANGUAGE]['rock_inputs'],
    beats: %i[scissors lizard]
  },
  paper: {
    inputs: MESSAGES[LANGUAGE]['paper_inputs'],
    beats: %i[rock spock]
  },
  scissors: {
    inputs: MESSAGES[LANGUAGE]['scissors_inputs'],
    beats: %i[paper lizard]
  }
}
EXTENDED_MOVES = {
  lizard: {
    inputs: MESSAGES[LANGUAGE]['lizard_inputs'],
    beats: %i[paper spock]
  },
  spock: {
    inputs: MESSAGES[LANGUAGE]['spock_inputs'],
    beats: %i[rock scissors]
  }
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

def play_game(game_state, win_count)
  loop do
    clear_screen
    move_selection(game_state)

    display_winner game_state
    update_scores game_state
    display_scores game_state

    break unless game_state[:player][:score] < win_count &&
                 game_state[:computer][:score] < win_count

    display_message 'continue'
    gets
  end
end

def move_selection(game_state)
  game_state[:player][:move_choice] = input_choice
  game_state[:computer][:move_choice] = MOVES.keys.sample

  display_message 'choices', game_state[:player][:move_choice],
                  game_state[:computer][:move_choice]
end

def input_choice
  input = ''
  loop do
    display_move_choices
    input = gets.chomp.downcase
    break if valid_move? input

    clear_screen
    display_message 'invalid'
  end

  convert_input_to_move(input)
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

def valid_move?(input)
  MOVES.any? { |_move, logic| logic[:inputs].include? input }
end

def convert_input_to_move(input)
  move = MOVES.find { |_move, logic| logic[:inputs].include? input }
  move[0]
end

def display_winner(game_state)
  message = if player_win? game_state
              'win'
            elsif computer_win? game_state
              'lose'
            else
              'tie'
            end
  display_message message
end

def update_scores(game_state)
  game_state[:player][:score] += player_win?(game_state) ? 1 : 0
  game_state[:computer][:score] += computer_win?(game_state) ? 1 : 0
end

def player_win?(game_state)
  player_move = game_state[:player][:move_choice]
  MOVES[player_move][:beats].include? game_state[:computer][:move_choice]
end

def computer_win?(game_state)
  computer_move = game_state[:computer][:move_choice]
  MOVES[computer_move][:beats].include? game_state[:player][:move_choice]
end

def display_scores(game_state)
  display_message('player_score', game_state[:player][:score])
  display_message('computer_score', game_state[:computer][:score])
end

def confirmation?
  input = ''
  loop do
    input = gets.chomp.downcase
    break if yes_no? input

    display_message 'invalid_confirmation'
  end

  # true for yes false for no
  input.start_with? message('confirm_character')
end

def yes_no?(string)
  (string.start_with? message('confirm_character')) ||
    (string.start_with? message('cancel_character'))
end

def get_round_count
  input = ''
  loop do
    input = gets.chomp
    break if valid_round_input input

    display_message 'invalid_round'
  end

  if input == ''
    3
  else
    input.to_i
  end
end

def valid_round_input(input)
  return true if input == ''

  integer?(input) && input.to_i > 0
end

def integer?(input)
  input.to_i.to_s == input
end

def display_grand_winner(game_state)
  box_size = 40
  winner = if game_state[:player][:score]
             'You are'
           else
             'The computer is'
           end
  winner_message = message 'grand_winner', winner

  puts "+-#{'-' * box_size}-+"
  puts "| #{' ' * box_size} |"
  puts "| #{winner_message.center(box_size)} |"
  puts "| #{' ' * box_size} |"
  puts "+-#{'-' * box_size}-+"
end

game_state = {
  player: {
    score: 0,
    move_choice: nil
  },
  computer: {
    score: 0,
    move_choice: nil
  }
}

clear_screen
display_message 'welcome'
display_message 'extended?'
extended_rules = true if confirmation?
display_message 'see_rules'
if confirmation?
  display_message(extended_rules ? 'extended_rules' : 'rules')
end

MOVES = extended_rules ? STANDARD_MOVES.merge(EXTENDED_MOVES) : STANDARD_MOVES

display_message 'rounds'
rounds_to_win = get_round_count

display_message 'ready'
# Await player input only
gets

loop do
  play_game(game_state, rounds_to_win)
  display_grand_winner(game_state)

  display_message 'play_again'
  break unless confirmation?
end

clear_screen
display_message 'thanks'
display_message 'goodbye'
