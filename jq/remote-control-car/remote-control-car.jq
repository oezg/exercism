def initial_battery_percentage: 100;
def initial_distance_driven_in_meters: 0;
def default_nickname: null;

def new_remote_control_car(nickname):
  {
    "battery_percentage": initial_battery_percentage, 
    "distance_driven_in_meters": initial_distance_driven_in_meters, 
    "nickname": nickname
  };

def new_remote_control_car:
  new_remote_control_car(default_nickname);

def display_distance:
  "\(.distance_driven_in_meters) meters";

def display_battery:
  if .battery_percentage == 0 
    then "Battery empty" 
    else "Battery at \(.battery_percentage)%" 
  end;

def drive:
  if .battery_percentage > 0 
    then .distance_driven_in_meters += 20 | .battery_percentage -= 1 
  end;
