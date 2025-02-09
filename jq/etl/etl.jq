def flatten_invert:
    {
        key: (.value[] | ascii_downcase),
        value: (.key | tonumber)
    };

.legacy | with_entries(flatten_invert)
