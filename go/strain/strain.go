// Package strain implements the keep and discard operation on collections.
package strain

type myConstraint interface {
	int | string | []int
}

// Given a collection and a predicate on the collection's elements,

// Keep returns a new collection containing those elements where the predicate is true.
func Keep[T myConstraint](s []T, p func(T) bool) []T {
	out := make([]T, 0, len(s))
	for _, v := range s {
		if p(v) {
			out = append(out, v)
		}
	}
	return out
}

// Discard returns a new collection containing those elements where the predicate is false.
func Discard[T myConstraint](s []T, p func(T) bool) []T {
	return Keep(s, func(t T) bool { return !p(t) })
}
