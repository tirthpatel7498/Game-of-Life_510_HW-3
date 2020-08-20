package main

import (
	"flag"
	"fmt"
	"math/rand"
)

// Generates the initial population with a propability of "sponateous birth" via the probability argument
func generateInitialPopulation(cols int, rows int, propability float64, generations int) []int {
	generation := make([]int, (cols+2)*(rows+2))
	for i := 0; i < len(generation); i++ {
		if isCell(cols, rows, i) && rand.Float64() < propability {
			generation[i] = 1
		}
	}
	return generation
}

// Prints the current generation and generates a new one
func generate(currentGeneration int, cols int, rows int, generation []int) []int {
	homeScreen()
	fmt.Printf("Current generation %d\n", currentGeneration)
	next := make([]int, len(generation))
	for i := 0; i < len(generation); i++ {
		if !isCell(cols, rows, i) {
			if right(cols, i) {
				fmt.Println()
			}
			continue
		}
		if generation[i] == 1 {
			fmt.Print(" x ")
		} else {
			fmt.Print("   ")
		}
		neighbors := neighbors(cols, generation, i)
		if generation[i] == 0 && neighbors == 3 {
			// birth
			next[i] = 1
		} else if generation[i] == 1 && (neighbors > 3 || neighbors < 2) {
			// over-crowding or lonely - dies
			next[i] = 0
		} else {
			next[i] = generation[i]
		}
	}
	return next
}

func neighbors(cols int, generation []int, i int) int {
	c := cols + 2
	// Find neighbors starting to left to bottom right
	return (generation[i-c-1] + generation[i-c] + generation[i-c+1] + generation[i-1] + generation[i+1] + generation[i+c-1] + generation[i+c] + generation[i+c+1])
}

// Our generation "matrix" has additional rows and columns to make computing neighbors easier. Therefore, we do not count
// elements in the top, left, right, or bottom sections as cells and will skip them
func isCell(cols int, rows int, idx int) bool {
	return !top(cols, idx) && !bottom(cols, rows, idx) && !left(cols, idx) && !right(cols, idx)
}

func top(cols int, idx int) bool {
	return idx <= (cols + 2)
}

func bottom(cols int, rows int, idx int) bool {
	return idx > (cols+2)*(rows+1)
}

func left(cols int, idx int) bool {
	return idx%(cols+2) == 0
}

func right(cols int, idx int) bool {
	return idx%(cols+2) == cols+1
}

func homeScreen() {
	fmt.Print("\033[1;1H")
}

func clearScreen() {
	fmt.Print("\033[2J")
}

func main() {

	// Declare options for the program
	propability := flag.Float64("propability", .619, "Initial density of population")
	generations := flag.Int("generations", 200, "number of generations to go through before exiting")
	cols := flag.Int("cols", 40, "number of columns")
	rows := flag.Int("rows", 40, "number of rows")

	flag.Parse()

	clearScreen()
	generation := generateInitialPopulation(*cols, *rows, *propability, *generations)
	currentGeneration := 0

	for *generations > 0 {
		currentGeneration++
		*generations--
		generation = generate(currentGeneration, *cols, *rows, generation)
		fmt.Scanln() // wait for Enter Key
	}

}
