PlannedShift.all.each do |planned_shift|
  if rand(0..5) == 5
    planned_shift.delete
  else
    planned_shift.check_in = planned_shift.check_in + 1.hour
    planned_shift.save!
  end
end
