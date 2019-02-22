# frozen_string_literal: true

class ::TickTackToe::Cli
  # @!attribute [r] board_printer
  #   @return [#call]
  # @!attribute [r] player_factory
  #   @return [#call]
  # @!attribute [r] game_factory
  #   @return [#call]
  attr_reader \
    :board_printer,
    :player_factory,
    :game_factory


  # @param board_printer  [#call]
  # @param player_factory [#call]
  # @param game_factory   [#call]
  #
  # @return [void]
  def initialize(board_printer, player_factory, game_factory)
    @board_printer  = board_printer
    @player_factory = player_factory
    @game_factory   = game_factory
  end

  # @return [self]
  def call
    banner

    game = @game_factory.call(::TickTackToe::PLAYERS_SIGNS_LIST.map(&method(:create_player)))

    puts "\n#{::TickTackToe::PLAYERS_SIGNS_LIST.first} moves first.\n\n"

    winner = game.move do |player|
      @board_printer.call(game.board)
    end

    if winner.nil?
      puts "No winners! You had a draw game!\n\n"
    else
      puts "Congratulations, #{winner.name} (#{winner.sign})! You won!\n\n"
    end

    self
  end

  # @return [self]
  def banner
    puts "\n  Tick Tack Toe\n\n"

    self
  end

  # @param sign [String]
  #
  # @return [::TickTackToe::Player]
  def create_player(sign)
    print "Enter name of #{sign} player: "

    @player_factory.call(sign, gets.chomp)
  end
end


require "tick_tack_toe/cli/board_printer"

require "tick_tack_toe/cli/error"
