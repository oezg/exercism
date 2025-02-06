import "scrabble-scores" as $scrabble_scores;

($scrabble_scores | first) as $scores
| .word
| ascii_downcase
| split("")
| map($scores[.])
| add // 0