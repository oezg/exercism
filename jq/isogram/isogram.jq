.phrase
| gsub("\\s|-"; "")
| ascii_downcase
| explode
| length as $count_letters
| unique
| length
| . == $count_letters