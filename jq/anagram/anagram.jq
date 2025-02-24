def anagram(word):
    . != word and (. / "" | sort) == (word / "" | sort);

(.subject | ascii_downcase) as $subject
| .candidates
| map(select(ascii_downcase | anagram($subject)))