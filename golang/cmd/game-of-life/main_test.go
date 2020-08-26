package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

// 0 0 0 0 0
// 0 1 0 0 0
// 0 0 0 0 0
// 0 0 0 0 0
// 0 0 0 0 0
func TestZeroNeighbors(t *testing.T) {
	rows := 3
	cols := 3

	generation := make([]int, (rows+2)*(cols+2))

	generation[7] = 1
	neighbors := neighbors(cols, generation, 7)

	assert.Equal(t, neighbors, 0, "The first cell has no alive neighbors")
}

// 0 0 0 0 0
// 0 1 0 0 0
// 0 1 0 0 0
// 0 0 0 0 0
// 0 0 0 0 0
func TestOneNeighbor(t *testing.T) {
	rows := 3
	cols := 3

	generation := make([]int, (rows+2)*(cols+2))

	generation[7] = 1
	generation[7+5] = 1
	neighbors := neighbors(cols, generation, 7)

	assert.Equal(t, neighbors, 0, "The first cell has no alive neighbors")
}
