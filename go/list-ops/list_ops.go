// Package listops implements basic list operations.
package listops

import "slices"

// IntList is an abstraction of a list of integers which we can define methods on
type IntList []int

func (s IntList) Foldl(fn func(int, int) int, initial int) int {
	if s.Length() == 0 {
		return initial
	}

	return s[1:].Foldl(fn, fn(initial, s[0]))
}

func (s IntList) Foldr(fn func(int, int) int, initial int) int {
	if s.Length() == 0 {
		return initial
	}

	return s[:s.Length()-1].Foldr(fn, fn(s[s.Length()-1], initial))
}

func (s IntList) Filter(fn func(int) bool) IntList {
	out := IntList{}

	for _, v := range s {
		if fn(v) {
			out = append(out, v)
		}
	}

	return out
}

func (s IntList) Length() int {
	return lengthHelper(0, s)
}

func lengthHelper(acc int, s IntList) int {
	if slices.Equal(IntList{}, s) {
		return acc
	}
	return lengthHelper(acc+1, s[1:])
}

func (s IntList) Map(fn func(int) int) IntList {
	out := make(IntList, 0, s.Length())

	for _, v := range s {
		out = append(out, fn(v))
	}

	return out
}

func (s IntList) Reverse() IntList {
	return reverseHelper(IntList{}, s)
}

func reverseHelper(acc IntList, s IntList) IntList {
	if slices.Equal(IntList{}, s) {
		return acc
	}
	return reverseHelper(append(acc, s[s.Length()-1]), s[:s.Length()-1])
}

func (s IntList) Append(lst IntList) IntList {
	if lst.Length() == 0 {
		return s
	}

	return append(s, lst[0]).Append(lst[1:])
}

func (s IntList) Concat(lists []IntList) IntList {
	if len(lists) == 0 {
		return s
	}

	return s.Append(lists[0]).Concat(lists[1:])
}
