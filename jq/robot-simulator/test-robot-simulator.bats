#!/usr/bin/env bats
# generated on 
load bats-extra
load bats-jq

@test 'Create robot:at origin facing north' {

    run jq -c -f robot-simulator.jq << 'END_INPUT'
      {
        "robot": {
          "position": {
            "x": 0,
            "y": 0
          },
          "direction": "north"
        }
      }
END_INPUT

    assert_success
    expected='{"position":{"x":0,"y":0},"direction":"north"}'
    assert_objects_equal "$output" "$expected"
}

@test 'Create robot:at negative position facing south' {

    run jq -c -f robot-simulator.jq << 'END_INPUT'
      {
        "robot": {
          "position": {
            "x": -1,
            "y": -1
          },
          "direction": "south"
        }
      }
END_INPUT

    assert_success
    expected='{"position":{"x":-1,"y":-1},"direction":"south"}'
    assert_objects_equal "$output" "$expected"
}

@test 'Rotating clockwise:changes north to east' {

    run jq -c -f robot-simulator.jq << 'END_INPUT'
      {
        "robot": {
          "position": {
            "x": 0,
            "y": 0
          },
          "direction": "north"
        },
        "instructions": "R"
      }
END_INPUT

    assert_success
    expected='{"position":{"x":0,"y":0},"direction":"east"}'
    assert_objects_equal "$output" "$expected"
}

@test 'Rotating clockwise:changes east to south' {

    run jq -c -f robot-simulator.jq << 'END_INPUT'
      {
        "robot": {
          "position": {
            "x": 0,
            "y": 0
          },
          "direction": "east"
        },
        "instructions": "R"
      }
END_INPUT

    assert_success
    expected='{"position":{"x":0,"y":0},"direction":"south"}'
    assert_objects_equal "$output" "$expected"
}

@test 'Rotating clockwise:changes south to west' {

    run jq -c -f robot-simulator.jq << 'END_INPUT'
      {
        "robot": {
          "position": {
            "x": 0,
            "y": 0
          },
          "direction": "south"
        },
        "instructions": "R"
      }
END_INPUT

    assert_success
    expected='{"position":{"x":0,"y":0},"direction":"west"}'
    assert_objects_equal "$output" "$expected"
}

@test 'Rotating clockwise:changes west to north' {

    run jq -c -f robot-simulator.jq << 'END_INPUT'
      {
        "robot": {
          "position": {
            "x": 0,
            "y": 0
          },
          "direction": "west"
        },
        "instructions": "R"
      }
END_INPUT

    assert_success
    expected='{"position":{"x":0,"y":0},"direction":"north"}'
    assert_objects_equal "$output" "$expected"
}

@test 'Rotating counter-clockwise:changes north to west' {

    run jq -c -f robot-simulator.jq << 'END_INPUT'
      {
        "robot": {
          "position": {
            "x": 0,
            "y": 0
          },
          "direction": "north"
        },
        "instructions": "L"
      }
END_INPUT

    assert_success
    expected='{"position":{"x":0,"y":0},"direction":"west"}'
    assert_objects_equal "$output" "$expected"
}

@test 'Rotating counter-clockwise:changes west to south' {

    run jq -c -f robot-simulator.jq << 'END_INPUT'
      {
        "robot": {
          "position": {
            "x": 0,
            "y": 0
          },
          "direction": "west"
        },
        "instructions": "L"
      }
END_INPUT

    assert_success
    expected='{"position":{"x":0,"y":0},"direction":"south"}'
    assert_objects_equal "$output" "$expected"
}

@test 'Rotating counter-clockwise:changes south to east' {

    run jq -c -f robot-simulator.jq << 'END_INPUT'
      {
        "robot": {
          "position": {
            "x": 0,
            "y": 0
          },
          "direction": "south"
        },
        "instructions": "L"
      }
END_INPUT

    assert_success
    expected='{"position":{"x":0,"y":0},"direction":"east"}'
    assert_objects_equal "$output" "$expected"
}

@test 'Rotating counter-clockwise:changes east to north' {

    run jq -c -f robot-simulator.jq << 'END_INPUT'
      {
        "robot": {
          "position": {
            "x": 0,
            "y": 0
          },
          "direction": "east"
        },
        "instructions": "L"
      }
END_INPUT

    assert_success
    expected='{"position":{"x":0,"y":0},"direction":"north"}'
    assert_objects_equal "$output" "$expected"
}

@test 'Moving forward one:facing north increments Y' {

    run jq -c -f robot-simulator.jq << 'END_INPUT'
      {
        "robot": {
          "position": {
            "x": 0,
            "y": 0
          },
          "direction": "north"
        },
        "instructions": "A"
      }
END_INPUT

    assert_success
    expected='{"position":{"x":0,"y":1},"direction":"north"}'
    assert_objects_equal "$output" "$expected"
}

@test 'Moving forward one:facing south decrements Y' {

    run jq -c -f robot-simulator.jq << 'END_INPUT'
      {
        "robot": {
          "position": {
            "x": 0,
            "y": 0
          },
          "direction": "south"
        },
        "instructions": "A"
      }
END_INPUT

    assert_success
    expected='{"position":{"x":0,"y":-1},"direction":"south"}'
    assert_objects_equal "$output" "$expected"
}

@test 'Moving forward one:facing east increments X' {

    run jq -c -f robot-simulator.jq << 'END_INPUT'
      {
        "robot": {
          "position": {
            "x": 0,
            "y": 0
          },
          "direction": "east"
        },
        "instructions": "A"
      }
END_INPUT

    assert_success
    expected='{"position":{"x":1,"y":0},"direction":"east"}'
    assert_objects_equal "$output" "$expected"
}

@test 'Moving forward one:facing west decrements X' {

    run jq -c -f robot-simulator.jq << 'END_INPUT'
      {
        "robot": {
          "position": {
            "x": 0,
            "y": 0
          },
          "direction": "west"
        },
        "instructions": "A"
      }
END_INPUT

    assert_success
    expected='{"position":{"x":-1,"y":0},"direction":"west"}'
    assert_objects_equal "$output" "$expected"
}

@test 'Follow series of instructions:moving east and north from README' {

    run jq -c -f robot-simulator.jq << 'END_INPUT'
      {
        "robot": {
          "position": {
            "x": 7,
            "y": 3
          },
          "direction": "north"
        },
        "instructions": "RAALAL"
      }
END_INPUT

    assert_success
    expected='{"position":{"x":9,"y":4},"direction":"west"}'
    assert_objects_equal "$output" "$expected"
}

@test 'Follow series of instructions:moving west and north' {

    run jq -c -f robot-simulator.jq << 'END_INPUT'
      {
        "robot": {
          "position": {
            "x": 0,
            "y": 0
          },
          "direction": "north"
        },
        "instructions": "LAAARALA"
      }
END_INPUT

    assert_success
    expected='{"position":{"x":-4,"y":1},"direction":"west"}'
    assert_objects_equal "$output" "$expected"
}

@test 'Follow series of instructions:moving west and south' {

    run jq -c -f robot-simulator.jq << 'END_INPUT'
      {
        "robot": {
          "position": {
            "x": 2,
            "y": -7
          },
          "direction": "east"
        },
        "instructions": "RRAAAAALA"
      }
END_INPUT

    assert_success
    expected='{"position":{"x":-3,"y":-8},"direction":"south"}'
    assert_objects_equal "$output" "$expected"
}

@test 'Follow series of instructions:moving east and north' {

    run jq -c -f robot-simulator.jq << 'END_INPUT'
      {
        "robot": {
          "position": {
            "x": 8,
            "y": 4
          },
          "direction": "south"
        },
        "instructions": "LAAARRRALLLL"
      }
END_INPUT

    assert_success
    expected='{"position":{"x":11,"y":5},"direction":"north"}'
    assert_objects_equal "$output" "$expected"
}
