.sentence 
| ascii_downcase 
| explode 
| unique 
| map(select(. >= 97 and . < 123)) 
| length == (123 - 97)