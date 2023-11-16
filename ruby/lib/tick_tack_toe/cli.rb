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
      ask_for_move(player, game.board.size) { |position| game.board.free?(position) }
    end

    @board_printer.call(game.board)

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

  # @param player     [::TickTackToe::Player]
  # @param board_size [Integer]
  #
  # @return [::TickTackToe::Position]
  #
  # @yieldparam position [::TickTackToe::Position] position on the board to
  #   check whether it is free.
  # @yieldreturn [Boolean]
  def ask_for_move(player, board_size)
    print "#{player.name} enter coordinates (x y) separated by space where " \
      "you want to put #{player.sign}: "
    x, y = gets.chomp.split(/\s+/)

    position = ::TickTackToe::Position.new(
      validate_move_coordinate(board_size, :x, x),
      validate_move_coordinate(board_size, :y, y)
    )

    raise ::TickTackToe::OccupiedCellError.occupied_cell_error(position) unless yield(position)

    position
  rescue ::TickTackToe::Error => e
    puts "Invalid input: #{e.message}"

    retry
  end

  # @param board_size       [Integer]
  # @param coordinate_name  [Symbol]
  # @param coordinate_value [String]
  #
  # @return [Integer]
  #
  # @raise [::TickTackToe::ValidationError] when given coordinate value is not
  #   a valid integer value.
  # @raise [::TickTackToe::ValidationError] when given coordinate value is a
  #   valid integer value, but does not correspond to columns or rows on the
  #   board, meaning it is higher then size of the board or lower then
  #   zero(first column or row).
  def validate_move_coordinate(board_size, coordinate_name, coordinate_value)
    int_coordinate = begin
      Integer(coordinate_value)
    rescue TypeError, ArgumentError => e
      raise ::TickTackToe::ValidationError.
        coordinate_is_not_an_integer_error(coordinate_name, coordinate_value)
    end

    if int_coordinate < 0 || int_coordinate >= board_size
      raise ::TickTackToe::ValidationError.
        coordinate_are_outside_of_playable_area(
          board_size, coordinate_name, int_coordinate)
    end

    int_coordinate
  end
end


require "tick_tack_toe/cli/board_printer"

require "tick_tack_toe/cli/error"
