BEGIN {
    for (temp = num; temp; temp = int(temp / 10)) digits[i++] = temp % 10

    for (j = 0; j < i; j++) temp += digits[j] ^ i

    print num == temp ? "true" : "false"
}
