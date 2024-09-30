package tournament

import (
	"bufio"
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
	sc := bufio.NewScanner(reader)
	league := tournament{}
	for sc.Scan() {
		line := strings.TrimSpace(sc.Text())
		// ignore comments and empty lines
		if line == "" || strings.HasPrefix(line, "#") {
			continue
		}
		fields := strings.Split(line, ";")
		if len(fields) != 3 {
			return errors.New("line must have 3 fields")
		}
		err := league.score(fields[0], fields[1], fields[2])
		if err != nil {
			return err
		}
	}
	if err := sc.Err(); err != nil {
		return err
	}
	_, err := writer.Write([]byte(league.table()))
	return err
}

type tournament map[string]performance

func (t tournament) score(home, visit, result string) error {
	homePerformance := t[home]
	visitorPerformance := t[visit]

	switch strings.ToLower(result) {
	case "win":
		homePerformance.win++
		visitorPerformance.loss++
	case "draw":
		homePerformance.draw++
		visitorPerformance.draw++
	case "loss":
		homePerformance.loss++
		visitorPerformance.win++
	default:
		return errors.New("invalid result: " + result)
	}

	t[home] = homePerformance
	t[visit] = visitorPerformance
	return nil
}

func (t tournament) table() string {
	names := make([]string, 0, len(t))
	for k := range t {
		names = append(names, k)
	}
	sort.Slice(names, func(i, j int) bool {
		a := t[names[i]].points()
		b := t[names[j]].points()
		return a > b || a == b && names[i] < names[j]
	})

	sb := strings.Builder{}
	sb.Grow(length * (1 + len(names)))
	sb.WriteString(header)
	for _, v := range names {
		p := t[v]
		fmt.Fprintf(&sb, template, v, p.matches(), p.win, p.draw, p.loss, p.points())
	}
	return sb.String()
}

type performance struct {
	win  int
	draw int
	loss int
}

func (p performance) matches() int {
	return p.win + p.draw + p.loss
}

func (p performance) points() int {
	return 3*p.win + p.draw
}

// 4. strings.Split instead of FieldsFunc
// BenchmarkTally-4           49650             24424 ns/op           40328 B/op        128 allocs/op

// 3. bufio.Scanner to read line by line
// BenchmarkTally-4           42301             30581 ns/op           40328 B/op        128 allocs/op

// 2. map of string to struct
// BenchmarkTally-4           52497             23596 ns/op           12290 B/op        117 allocs/op

// 1. map of string to int slice
// BenchmarkTally-4           59395             20579 ns/op           13026 B/op        158 allocs/op
