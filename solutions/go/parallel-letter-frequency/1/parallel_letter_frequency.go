package letter

import (
	"sync"
)

// FreqMap records the frequency of each rune in a given text.
type FreqMap map[rune]int

func Frequency(text string) FreqMap {
	frequencies := FreqMap{}
	for _, r := range text {
		frequencies[r]++
	}
	return frequencies
}

func worker(text string, fmp chan FreqMap, wg *sync.WaitGroup) {
	defer wg.Done()
	fmp <- Frequency(text)
}

// ConcurrentFrequency counts the frequency of each rune in the given strings,
// by making use of concurrency.
func ConcurrentFrequency(texts []string) FreqMap {
	var wg sync.WaitGroup
	result := make(FreqMap)
	freqMapChan := make(chan FreqMap, len(texts))
	wg.Add(len(texts))
	for _, text := range texts {
		go worker(text, freqMapChan, &wg)
	}
	wg.Wait()
	close(freqMapChan)

	for freqMap := range freqMapChan {
		for r, i := range freqMap {
			result[r] += i
		}
	}
	return result
}
