def is_valid_command:
  "chatbot" as $command | test("^ \($command) \\b"; "ix");

def remove_emoji:  # emojiNNNN
  gsub("\\b emoji \\d{4} \\b"; ""; "x");

def is_valid_phone_number:  # (+NN) NNN-NNN-NNN
  test("\\( \\+ \\d{2} \\) \\s \\d{3} - \\d{3} - \\d{3}"; "x");

def check_phone_number:
  if is_valid_phone_number 
    then "Thanks! Your phone number is OK."
    else "Oops, it seems like I can't reach out to \(.)."
  end;

def get_domains: 
  [scan("(?: \\w+ \\.)+ \\w {2,3}"; "x")];

def extract_name:
  capture("my name is (?<name>[a-z-]+)"; "i").name;

def nice_to_meet_you:
  "Someone" as $default_name |
  "Nice to meet you, \(extract_name // $default_name)";

def parse_csv:
  split(", \\s*"; "x");
