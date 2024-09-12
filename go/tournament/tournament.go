package tournament

import (
	"errors"
	"fmt"
	"io"
	"sort"
	"strings"
)

const (
	header   = "Team                           | MP |  W |  D |  L |  P\n"
	template = "%-31s| %2d | %2d | %2d | %2d | %2d\n"
	length   = len(header)
)

func Tally(reader io.Reader, writer io.Writer) error {
	buf := make([]byte, 512)
	n, err := reader.Read(buf)
	if err != nil {
		return err
	}

	lines := strings.Split(string(buf[:n]), "\n")
	league := tournament{}
	for _, line := range lines {
		// ignore comments and newlines
		if len(line) == 0 || line[0] == '#' {
			continue
		}
		fields := strings.Split(line, ";")
		if len(fields) != 3 {
			return errors.New("line must have 3 fields")
		}
		err = league.score(fields[0], fields[1], fields[2])
		if err != nil {
			return err
		}
	}
	_, err = writer.Write([]byte(league.table()))
	return err
}

type tournament map[string][]int

func (t tournament) score(home, visit, result string) error {
	switch result {
	case "win":
		t[home] = append(t[home], 3)
		t[visit] = append(t[visit], 0)
	case "draw":
		t[home] = append(t[home], 1)
		t[visit] = append(t[visit], 1)
	case "loss":
		t[home] = append(t[home], 0)
		t[visit] = append(t[visit], 3)
	default:
		return errors.New("result can only be win, draw or loss")
	}
	return nil
}

func (t tournament) points(name string) (points [5]int) {
	for _, v := range t[name] {
		points[v]++
		points[2]++
		points[4] += v
	}
	return
}

func (t tournament) table() string {
	names := make([]string, 0, len(t))
	for k := range t {
		names = append(names, k)
	}
	sort.Slice(names, func(i, j int) bool {
		a := t.points(names[i])[4]
		b := t.points(names[j])[4]
		return a > b || a == b && names[i] < names[j]
	})

	sb := strings.Builder{}
	sb.Grow(length * (1 + len(names)))
	sb.WriteString(header)
	for _, v := range names {
		p := t.points(v)
		fmt.Fprintf(&sb, template, v, p[2], p[3], p[1], p[0], p[4])
	}
	return sb.String()
}

// BenchmarkTally-4           59395             20579 ns/op           13026 B/op        158 allocs/op
