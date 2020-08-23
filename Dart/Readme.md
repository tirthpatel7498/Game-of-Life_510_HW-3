# Coding the famous Conway's Game-of-Life in Dart Language! 

# Introduction
Conway's Game of Life is a cellular automaton game. It is a zero-player game, meaning that its evolution is determined by its initial state, requiring no further input.

## Rules of Game
The game starts with a random initial population, which will further evolve on its own(requiring no further input) into new generation by following the rules mentioned below, and the process goes on either for infinity or becomes extinct after some generations.

     C   N                 new C
     1   0,1             ->  0  // Lonely
     1   4,5,6,7,8       ->  0  // Overcrowded
     1   2,3             ->  1  // Lives
     0   3               ->  1  // It takes three to give birth!
     0   0,1,2,4,5,6,7,8 ->  0  // Barren


## Output of Code

![Output of original codes](output.gif)

## Dart Installation

[Dart SDK Installation Guide](https://dart.dev/get-dart)

## Usage
After complete installation of Dart SDK,

Open terminal or command-prompt and run the following command with proper arguements,
	
    $ dart gol_v2.dart <rows> <columns> <generations>
eg. For a game board of 5x5 for 5 generations,

    $ dart gol_v2.dart 5 5 5    

## Sample Output
![Output of original codes](output.gif)

## Making Contributions
Please ensure you are abiding by our Code of Conduct and Contribution guidelines when making contributions to this repository.

## Contact
Contact me at this email for any queries:
hmkachha@ncsu.edu