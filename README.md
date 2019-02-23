# Tick Tack Toe Game

## Overview

In this repository you can find implementation of
[Tick Tack Toe](https://en.wikipedia.org/wiki/Tic-tac-toe) game written
in different languages. Each programming language has its own subdirectory
where you can find all related files to that particular implementation.
For example, check [Ruby implementation](ruby/).

Main purpose of writing this small project was to training myself to write
in different languages implementation of same task. As times goes by my
knowledge of languages I learned someday goes away and tasks like this
allows to keep things I learned in my head.

Apart of the above I was quite curious to see how code of in various languages
would look like as I try to implement same thing and how distinctions
of the languages influence implementation details.

## Requirements

There could be many small different details in implementation of the game.
When I just tried to google them I found tons of code. Also on GitHub just
searching for "tick tack toe" gives enough results for a day of investigation.

Nevertheless, I found [m2mathew's](https://github.com/m2mathew/)
[repository](https://github.com/m2mathew/command-line-tic-tac-toe) with a
decent description of the task of writing Tick Tack Toe game.
So, I shameless copied it here to keep everything in one place.

### Normal Mode

You will create a two player tic-tac-toe game. The game should start by
asking for player one's name and then player two's name. At each stage
of the game the current game board should be displayed like so:

```
	    1   2   3
	  ~~~~~~~~~~~~~
	1 |   |   |   |
	  ~~~~~~~~~~~~~
	2 |   |   |   |
	  ~~~~~~~~~~~~~
	3 |   |   |   |
	  ~~~~~~~~~~~~~
```
(this would be an example of a game before that first move has been made)

After displaying the game board your game should prompt the current player
for their move. Players will enter their moves int he form of coordinates.
For example if a player enters `1 1` then their mark (either X or O) will
be placed in the upper left corner. The x (horizontal) coordinate is the
first number and the y (vertical) coordinate is the second number that will
be entered by the user. For example, `2 1` would place a mark like so:

```
	    1   2   3
	  ~~~~~~~~~~~~~
	1 |   | X |   |
	  ~~~~~~~~~~~~~
	2 |   |   |   |
	  ~~~~~~~~~~~~~
	3 |   |   |   |
	  ~~~~~~~~~~~~~
```

* If a player enters invalid format for their input (ie. there are not two
  numbers, or they don't separate the numbers with a space) they should be
  given the error *Invalid input: you must enter the x and y coordinates
  separated by spaces* and then prompted to enter coordinates again.
  They should continue to be prompted for coordinates until they don't get
  an error.
* If a player enters a valid format but the numbers are outside of the game
  area (for example `1, 4`) they should be given the error *Invalid input:
  those coordinates are outside the playable area* and then prompted to
  enter coordinates again. They should continue to be prompted for
  coordinates until they don't get an error.
* If a player enters a valid format that is inside the game area but there
  is already a mark in that space they should be give the error *Invalid
  input: that space is already taken* and then prompted to enter coordinates
  again. They should continue to be prompted for coordinates until they
  don't get an error.

After each time a new mark is made on the game board, your game should
check to see if there's a winner. If there is, the game should end and
it should display a message saying which player won.

### Hard Mode

* After a player wins the game should ask if you want to play again,
  which will start the game over by asking players for their names again.
* At any point if a player types in the word 'forfeit' your game should
  end and display a message saying that the other play (the one who didn't
  forfeit) is the winner.

### Nightmare Mode

Change your game to be a one player game where you play against a computer
AI that never loses.

## Programming Languages

This is a list of languages used for implementation of the game. If you don't
know distinctions of particular language read article on Wikipedia and spend
some time reading materials on official website.

* [Ruby](ruby/):
  [Wikipedia](https://en.wikipedia.org/wiki/Ruby_(programming_language)),
  [Official Site](https://www.ruby-lang.org/)
