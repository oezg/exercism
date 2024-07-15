package series

func All(n int, s string) []string {
	if len(s) < n {
		return nil
	}

	out := make([]string, 0, len(s)-n+1)

	for i := 0; i+n <= len(s); i++ {
		out = append(out, s[i:i+n])
	}
	return out
}

func UnsafeFirst(n int, s string) string {
	return s[:n]
}

func First(n int, s string) (string, bool) {
	if len(s) < n {
		return "", false
	}
	return UnsafeFirst(n, s), true
}
