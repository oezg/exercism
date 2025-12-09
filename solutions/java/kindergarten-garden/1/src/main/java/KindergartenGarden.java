import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

class KindergartenGarden {

  public static final String[] students = {
    "Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph",
    "Kincaid", "Larry"
  };
  Map<String, List<Plant>> plants = new HashMap<>();

  KindergartenGarden(String garden) {
    assert garden.matches("[GCRV]{2,}\n[GCRV]{2,}");
    var rows = garden.split("\n");
    var firstRow = rows[0];
    var secondRow = rows[1];
    var rowLength = firstRow.length();
    assert rowLength == secondRow.length();
    assert rowLength % 2 == 0;

    for (int i = 0; i < rowLength; i += 2) {
      List<Plant> studentPlants = new ArrayList<>();
      var letters = firstRow.substring(i, i + 2) + secondRow.substring(i, i + 2);
      for (char letter : letters.toCharArray()) {
        studentPlants.add(Plant.getPlant(letter));
      }
      plants.put(students[i / 2], studentPlants);
    }
  }

  List<Plant> getPlantsOfStudent(String student) {
    return plants.get(student);
  }
}
