// Package sublist determies the relationship between two lists.
package sublist

import "slices"

// Sublist returns the relation given two lists.
func Sublist(listA, listB []int) Relation {
	switch {
	case slices.Equal(listA, listB):
		return RelationEqual
	case len(listA) < len(listB) && isSubsequence(listA, listB):
		return RelationSublist
	case len(listA) > len(listB) && isSubsequence(listB, listA):
		return RelationSuperlist
	default:
		return RelationUnequal
	}
}

func isSubsequence(a, b []int) bool {
	switch {
	case len(b) < len(a):
		return false
	case slices.Equal(a, b[:len(a)]):
		return true
	default:
		return isSubsequence(a, b[1:])
	}
}

// 3. slices.Equal
// BenchmarkSublist-4       5981191               196.6 ns/op             0 B/op          0 allocs/op

// 2. with switch
// BenchmarkSublist-4       3496443               336.4 ns/op             0 B/op          0 allocs/op

// 1. with if
// BenchmarkSublist-4       3493243               340.9 ns/op             0 B/op          0 allocs/op
