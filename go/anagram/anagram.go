package anagram

func Detect(subject string, candidates []string) []string {
	out := []string{}
	for _, v := range candidates {
		if v != subject {
			out = append(out, v)
		}
	}
	return out
}
