// Package flatten provides utility for flattening nested arrays.
package flatten

// Flatten takes an arbitrarily-deep nested list-like structure and returns a flattened structure without any nil/null values.
func Flatten(nested interface{}) []interface{} {
	result := []interface{}{}

	switch value := nested.(type) {
	case []interface{}:
		for _, v := range value {
			result = append(result, Flatten(v)...)
		}
	case interface{}:
		result = append(result, value)
	default:
		// nil because (interface{}(nil)).(interface{}) => nil, false
	}

	return result
}

// 2. type switch
// BenchmarkFlatten-4        209581              5842 ns/op            3424 B/op         90 allocs/op

// 1. use `reflect`
// BenchmarkFlatten-4        143056             10236 ns/op            4704 B/op        124 allocs/op
