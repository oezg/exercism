class LocomotiveEngineer

  def self.generate_list_of_wagons(*array)
    array
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    a, b, loc, *rest = each_wagons_id
    [loc, *missing_wagons, *rest, a, b]
  end

  def self.add_missing_stops(routing, **cities)
    {**routing, stops: cities.values}
  end

  def self.extend_route_information(route, more_route_information)
    {**route, **more_route_information}
  end

end
