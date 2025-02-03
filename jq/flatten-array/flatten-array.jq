def fltn: if type == "array" then .[] | fltn end;

[.array[] | fltn | select(. != null)]