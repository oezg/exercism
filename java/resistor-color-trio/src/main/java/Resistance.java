public class Resistance {
    int multiplier;
    Unit unit;

    public Resistance(long value) {
        unit = Unit.forValue(value);
        multiplier = (int) (value / unit.getExponent());
    }

    @Override
    public String toString() {
        return String.format("%d %sohms", multiplier, unit.getPrefix());
    }
}
