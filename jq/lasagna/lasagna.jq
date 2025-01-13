40 as $expected_minutes_in_oven
| 2 as $minutes_per_layer
| .actual_minutes_in_oven //= 0
| ($minutes_per_layer * (.number_of_layers // 1)) as $preparation_time |
{
  $expected_minutes_in_oven,
  remaining_minutes_in_oven: ($expected_minutes_in_oven - .actual_minutes_in_oven),
  $preparation_time,
  total_time: ($preparation_time + .actual_minutes_in_oven)
}
