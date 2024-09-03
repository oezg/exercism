package stringset

import "strings"

// Set is a collection of unique string values.
type Set struct {
	members map[string]struct{}
}

func New() Set {
	return Set{make(map[string]struct{})}
}

func NewFromSlice(l []string) Set {
	s := New()
	for _, v := range l {
		s.members[v] = struct{}{}
	}
	return s
}

func (s Set) String() string {
	mems := []string{}

	for k := range s.members {
		mems = append(mems, "\""+k+"\"")
	}

	return "{" + strings.Join(mems, ", ") + "}"
}

func (s Set) IsEmpty() bool {
	return len(s.members) == 0
}

func (s Set) Has(elem string) bool {
	_, ok := s.members[elem]
	return ok
}

func (s Set) Add(elem string) {
	s.members[elem] = struct{}{}
}

func Subset(s1, s2 Set) bool {
	for k := range s1.members {
		if !s2.Has(k) {
			return false
		}
	}

	return true
}

func Disjoint(s1, s2 Set) bool {
	for k := range s1.members {
		if s2.Has(k) {
			return false
		}
	}

	return true
}

func Equal(s1, s2 Set) bool {

	return Subset(s1, s2) && Subset(s2, s1)
}

func Intersection(s1, s2 Set) Set {
	out := New()

	for k := range s1.members {
		if s2.Has(k) {
			out.Add(k)
		}
	}

	return out
}

func Difference(s1, s2 Set) Set {
	out := New()

	for k := range s1.members {
		if !s2.Has(k) {
			out.Add(k)
		}
	}

	return out
}

func Union(s1, s2 Set) Set {
	out := New()

	for k := range s1.members {
		out.Add(k)
	}

	for k := range s2.members {
		out.Add(k)
	}

	return out
}
