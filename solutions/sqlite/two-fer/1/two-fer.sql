-- Schema: CREATE TABLE "twofer" ("input" TEXT, "response" TEXT);
-- Task: update the twofer table and set the response based on the input.
update twofer
set
    response = case
        when input is null
        or input = '' then 'One for you, one for me.'
        else concat ('One for ', input, ', one for me.')
    end