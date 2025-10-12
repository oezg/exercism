function assert(condition, message) {
    if (!condition) {
        print message > "/dev/stderr"
        exit 1
    }
}
