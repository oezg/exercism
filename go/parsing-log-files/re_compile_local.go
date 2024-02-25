// Package parsinglogfiles is a learning exercise for regular expressions
package parsinglogfiles

import (
	"fmt"
	"regexp"
)

// IsValidLine tests if a line begins with a log identifier.
func IsValidLineLocal(text string) bool {
	re := regexp.MustCompile(`^\[(TRC|DBG|INF|WRN|ERR|FTL)]`)
	return re.MatchString(text)
}

// SplitLogLine splits the log line into fields.
func SplitLogLineLocal(text string) []string {
	re := regexp.MustCompile(`<[~*=-]*>`)
	return re.Split(text, -1)
}

// CountQuotedPasswords counts the number of lines containing
// case insensitive password in quoted text.
func CountQuotedPasswordsLocal(lines []string) int {
	count := 0
	re := regexp.MustCompile(`(?i)".*password.*"`)
	for _, line := range lines {
		if re.MatchString(line) {
			count++
		}
	}
	return count
}

// RemoveEndOfLineText removes the text "end-of-line" followed by a line number.
func RemoveEndOfLineTextLocal(text string) string {
	re := regexp.MustCompile(`end-of-line\d+`)
	return re.ReplaceAllString(text, "")
}

// TagWithUserName tags lines that refer to users with user names.
func TagWithUserNameLocal(lines []string) []string {
	var taggedLines []string
	re := regexp.MustCompile(`User\s+(\S+)`)
	for _, line := range lines {
		if submatches := re.FindStringSubmatch(line); submatches != nil {
			taggedLines = append(taggedLines, fmt.Sprintf("[USR] %s %s", submatches[1], line))
		} else {
			taggedLines = append(taggedLines, line)
		}
	}
	return taggedLines
}
