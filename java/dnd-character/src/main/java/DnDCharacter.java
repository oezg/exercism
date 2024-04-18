import java.lang.Math;
import java.util.ArrayList;
import java.util.List;

class DnDCharacter {
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
        List<Integer> out = new ArrayList<>();
        for (int i = 0; i < 4; i++) {
            int dice = (int) (Math.random() * 6) + 1;
            out.add(dice);
        }
        return out;
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
