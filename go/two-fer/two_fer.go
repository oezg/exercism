// Package twofer determines what you will say as you give away the extra cookie.
// https://golang.org/doc/effective_go.html#commentary
package twofer

import "fmt"

// ShareWith one for you one for me.
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}
	return fmt.Sprintf("One for %s, one for me.", name)
}
