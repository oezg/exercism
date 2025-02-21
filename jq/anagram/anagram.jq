(.subject | ascii_downcase) as $subject
| ($subject | explode | sort) as $anagram
| .candidates
| map(select(ascii_downcase | . != $subject and (explode | sort) == $anagram))