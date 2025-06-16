#!/usr/bin/env bash

DISABLE='@Disabled("Remove to run test")'
IMPORT="import org.junit.jupiter.api.Disabled;"

enable_next_test() {
  find "$PWD/src/test/java" \
    -name "*Test.java" \
    -exec sed -i "0,/$DISABLE/{/$DISABLE/d;}" {} \; \
    -quit
}

enable_all_tests() {
  find "$PWD/src/test/java" \
    -name "*Test.java" \
    -exec sed -i -e "/$IMPORT/d" -e "/$DISABLE/d" {} \; \
    -quit
}

if [ $# -eq 0 ]; then
  enable_next_test
else
  enable_all_tests
fi
./gradlew test
