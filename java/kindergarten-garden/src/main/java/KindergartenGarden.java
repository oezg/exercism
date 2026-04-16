import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

class KindergartenGarden {

  public static final String[] students = {
    "Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph",
    "Kincaid", "Larry"
  };
  Map<String, Plant[]> plants = new HashMap<>();

  KindergartenGarden(String garden) {
    if (!garden.matches("[GCRV]{2,}\n[GCRV]{2,}"))
      throw new IllegalArgumentException();
    var rows = garden.split("\n", 2);
    var firstRow = rows[0];
    var secondRow = rows[1];;
    var rowLength = firstRow.length();
    if  (rowLength != secondRow.length() || rowLength % 2 != 0)
      throw new IllegalArgumentException();

    for (int i = 0; i < rowLength / 2; i++) {
      var idx = 2 * i;
      Plant[] studentPlants = new Plant[4];
      studentPlants[0] = Plant.getPlant(firstRow.charAt(idx));
      studentPlants[1] = Plant.getPlant(firstRow.charAt(idx + 1));
      studentPlants[2] = Plant.getPlant(secondRow.charAt(idx));
      studentPlants[3] = Plant.getPlant(secondRow.charAt(idx + 1));
      plants.put(students[i], studentPlants);
    }
  }

  Plant[] getPlantsOfStudent(String student) {
    return plants.get(student);
  }
}
