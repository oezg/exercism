package chessboard

// Declare a type named File which stores if a square is occupied by a piece - this will be a slice of bools
type File []bool

// Declare a type named Chessboard which contains a map of eight Files, accessed with keys from "A" to "H"
type Chessboard map[string]File

// CountInFile expects a Chessboard and a string. It returns how many squares are occupied in the chessboard,
// within the given file.
func CountInFile(cb Chessboard, file string) (count int) {
	for _, square := range cb[file] {
		if square {
			count++
		}
	}
	return
}

// CountInRank expects a Chessboard and an integer. It returns how many squares are occupied in the chessboard,
// within the given rank.
func CountInRank(cb Chessboard, rank int) (count int) {
	if rank < 1 || rank > 8 {
		return
	}
	for _, file := range cb {
		if file[rank-1] {
			count++
		}
	}
	return
}

// CountAll expects a Chessboard. It should count how many squares are present in the chessboard.
func CountAll(cb Chessboard) (count int) {
	for _, file := range cb {
		count += len(file)
	}
	return
}

// CountOccupied expects a Chessboad. It returns how many squares are occupied in the chessboard.
func CountOccupied(cb Chessboard) (count int) {
	for _, file := range cb {
		for _, square := range file {
			if square {
				count++
			}
		}
	}
	return
}
