{
  last_week: .[-2],  # output the array for last week's data

  yesterday: last.[-2],  # output count for yesterday in this week's data
  
  total: last | add,  # output sum of counts for this week's data
  
  busy_days: last | map(select(. >= 5)) | length,  # output number of days with 5 or more birds in this week's data
  
  has_day_without_birds: last | any(. == 0)  # output true if any day this week has zero birds
}
