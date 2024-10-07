module LocomotiveEngineer

  def generate_list_of_wagons(*wagon_ids)
    wagon_ids
  end

  def fix_list_of_wagons(each_wagons_id, missing_wagons)
    first_wagon, second_wagon, locomotive, *rest = each_wagons_id
    [locomotive, *missing_wagons, *rest, first_wagon, second_wagon]
  end

  def add_missing_stops(routing, **stops)
    {**routing, stops: stops.values}
  end

  def extend_route_information(route, more_route_information)
    {**route, **more_route_information}
  end

end

LocomotiveEngineer.extend LocomotiveEngineer
