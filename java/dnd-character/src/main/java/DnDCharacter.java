import java.lang.Math;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

class DnDCharacter {
    static Random random = new Random();

    int strength;
    int dexterity;
    int constitution;
    int intelligence;
    int wisdom;
    int charisma;
    int hitpoints;

    public DnDCharacter() {
        strength = ability(rollDice());
        dexterity = ability(rollDice());
        constitution = ability(rollDice());
        intelligence = ability(rollDice());
        wisdom = ability(rollDice());
        charisma = ability(rollDice());
        hitpoints = 10 + modifier(constitution);
    }

    int ability(List<Integer> scores) {
        return scores.stream().sorted().skip(1).reduce(0, (a, b) -> a + b);
    }

    List<Integer> rollDice() {
        return random.ints(4, 1, 7).boxed().collect(Collectors.toList());
    }

    int modifier(int input) {
        return Math.floorDiv(input - 10, 2);
    }

    int getStrength() {
        return strength;
    }

    int getDexterity() {
        return dexterity;
    }

    int getConstitution() {
        return constitution;
    }

    int getIntelligence() {
        return intelligence;
    }

    int getWisdom() {
        return wisdom;
    }

    int getCharisma() {
        return charisma;
    }

    int getHitpoints() {
        return hitpoints;
    }
}
