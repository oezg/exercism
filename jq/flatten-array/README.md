# Flatten Array

Welcome to Flatten Array on Exercism's jq Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Take a nested list and return a single flattened list with all values except nil/null.

The challenge is to take an arbitrarily-deep nested list-like structure and produce a flattened structure without any nil/null values.

For example:

input: [1,[2,3,null,4],[null],5]

output: [1,2,3,4,5]

## jq-specific Instructions

There is a builtin [`flatten`][flatten] function that largely solves this exercise.
Try to solve this yourself without using the builtin `flatten` function to get the most out of this exercise.

<details><summary>Click here for hints:</summary>

* A recursive function can be useful.
  Learn more about recursion in the [Recursion lesson][recur].
* The [`type`][type] function can help.
</details>

[flatten]: https://jqlang.github.io/jq/manual/v1.7/#flatten
[type]: https://jqlang.github.io/jq/manual/v1.7/#type
[recur]: https://exercism.org/tracks/jq/concepts/recursion

## Source

### Created by

- @MatthijsBlom

### Based on

Interview Question - https://reference.wolfram.com/language/ref/Flatten.html