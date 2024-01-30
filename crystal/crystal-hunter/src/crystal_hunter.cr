class Rules
  def bonus_points?(power_up_active : Bool, touching_bandit : Bool) : Bool
    power_up_active && touching_bandit
  end

  def score?(touching_power_up : Bool, touching_crystal : Bool) : Bool
    touching_power_up || touching_crystal
  end

  def lose?(power_up_active : Bool, touching_bandit : Bool) : Bool
    !power_up_active && touching_bandit
  end

  def win?(has_picked_up_all_crystals : Bool, power_up_active : Bool, touching_bandit : Bool) : Bool
    has_picked_up_all_crystals && !lose?(power_up_active, touching_bandit)
  end
end
