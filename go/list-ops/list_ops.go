// Package listops implements basic list operations.
package listops

// IntList is an abstraction of a list of integers which we can define methods on
type IntList []int
type binaryFunc func(int, int) int
type unaryFunc func(int) int
type predicateFunc func(int) bool

func (s IntList) Foldl(fn binaryFunc, initial int) int {
	result := initial

	for _, v := range s {
		result = fn(result, v)
	}

	return result
}

func (s IntList) Foldr(fn binaryFunc, initial int) int {
	result := initial

	for i := s.Length() - 1; i >= 0; i-- {
		result = fn(s[i], result)
	}

	return result
}

func (s IntList) Filter(fn predicateFunc) IntList {
	result := IntList{}

	for _, v := range s {
		if fn(v) {
			result = append(result, v)
		}
	}

	return result
}

func (s IntList) Length() (length int) {
	for range s {
		length++
	}
	return
}

func (s IntList) Map(fn unaryFunc) IntList {
	result := make(IntList, s.Length())

	for i, v := range s {
		result[i] = fn(v)
	}

	return result
}

func (s IntList) Reverse() IntList {
	result := make(IntList, 0, s.Length())

	for i := s.Length() - 1; i >= 0; i-- {
		result = append(result, s[i])
	}

	return result
}

func (s IntList) Append(lst IntList) IntList {
	sLength := s.Length()
	result := make(IntList, sLength+lst.Length())

	copy(result, s)
	copy(result[sLength:], lst)

	return result
}

func (s IntList) Concat(lists []IntList) IntList {
	result := s

	for _, v := range lists {
		result = result.Append(v)
	}

	return result
}
