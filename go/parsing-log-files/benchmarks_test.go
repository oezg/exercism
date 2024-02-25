package parsinglogfiles

import "testing"

func BenchmarkIsValidLine(b *testing.B) {
	texts := []string{
		"[ERR] A good error here",
		"[INF] The latest information",
		"Any old [ERR] text",
		"bad start to [INF] Message",
		"[BOB] Any old text",
		"text",
		"",
	}
	for i := 0; i < b.N; i++ {
		for _, text := range texts {
			// IsValidLineLocal(text)
			IsValidLine(text)
		}
	}
}

func BenchmarkSplitLogLine(b *testing.B) {
	texts := []string{
		"section 1<*>section 2<~~~>section 3",
		"section 1<=>section 2<-*~*->section 3",
		"section 1<>section 2",
		"<start> <end>",
		"",
	}
	for i := 0; i < b.N; i++ {
		for _, text := range texts {
			// SplitLogLineLocal(text)
			SplitLogLine(text)
		}
	}
}

func BenchmarkCountQuotedPasswords(b *testing.B) {
	texts := [][]string{
		{
			``,
			`[INF] passWord`,
			`"passWord"`,
			`[INF] User saw error message "Unexpected Error" on page load.`,
			`[INF] The message "Please reset your password" was ignored by the user`,
		},
		{
			`passWord"passWor"`,
		},
	}
	for i := 0; i < b.N; i++ {
		for _, text := range texts {
			// CountQuotedPasswordsLocal(text)
			CountQuotedPasswords(text)
		}
	}
}

func BenchmarkRemoveEndOfLineText(b *testing.B) {
	text := "[INF] end-of-line23033 Network Failure end-of-line27"
	for i := 0; i < b.N; i++ {
		// RemoveEndOfLineTextLocal(text)
		RemoveEndOfLineText(text)
	}
}

func BenchmarkTagWithUserName(b *testing.B) {
	text := []string{
		"[WRN] User James123 has exceeded storage space.",
		"[WRN] Host down. User   Michelle4 lost connection.",
		"[INF] Users can login again after 23:00.",
		"[DBG] We need to check that user names are at least 6 chars long.",
	}
	for i := 0; i < b.N; i++ {
		// TagWithUserNameLocal(text)
		TagWithUserName(text)
	}
}
