// Package parsinglogfiles is a learning exercise for regular expressions
package parsinglogfiles

import (
	"fmt"
	"regexp"
)

const (
	identifier = `^\[(TRC|DBG|INF|WRN|ERR|FTL)]`
	separator  = `<[~*=-]*>`
	password   = `(?i)".*password.*"`
	endOfLine  = `end-of-line\d+`
	username   = `User\s+(\S+)`
)

var (
	identifierRegexp = regexp.MustCompile(identifier)
	separatorRegexp  = regexp.MustCompile(separator)
	passwordRegexp   = regexp.MustCompile(password)
	endOfLineRegexp  = regexp.MustCompile(endOfLine)
	usernameRegexp   = regexp.MustCompile(username)
)

// IsValidLine tests if a line begins with a log identifier.
func IsValidLine(text string) bool {
	return identifierRegexp.MatchString(text)
}

// SplitLogLine splits the log line into fields.
func SplitLogLine(text string) []string {
	return separatorRegexp.Split(text, -1)
}

// CountQuotedPasswords counts the number of lines containing
// case insensitive password in quoted text.
func CountQuotedPasswords(lines []string) int {
	count := 0
	for _, line := range lines {
		if passwordRegexp.MatchString(line) {
			count++
		}
	}
	return count
}

// RemoveEndOfLineText removes the text "end-of-line" followed by a line number.
func RemoveEndOfLineText(text string) string {
	return endOfLineRegexp.ReplaceAllString(text, "")
}

// TagWithUserName tags lines that refer to users with user names.
func TagWithUserName(lines []string) []string {
	var taggedLines []string
	for _, line := range lines {
		if submatches := usernameRegexp.FindStringSubmatch(line); submatches != nil {
			taggedLines = append(taggedLines, fmt.Sprintf("[USR] %s %s", submatches[1], line))
		} else {
			taggedLines = append(taggedLines, line)
		}
	}
	return taggedLines
}
