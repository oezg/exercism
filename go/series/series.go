package series

func All(n int, s string) (out []string) {

	for i := 0; i+n <= len(s); i++ {
		out = append(out, s[i:i+n])
	}

	return
}

func UnsafeFirst(n int, s string) (out string) {

	if result := All(n, s); len(result) > 0 {
		out = result[0]
	}

	return
}

func First(n int, s string) (first string, ok bool) {

	if result := UnsafeFirst(n, s); len(result) > 0 {
		first = result
		ok = true
	}

	return
}
