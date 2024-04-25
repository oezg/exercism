public enum Unit {
    GIGA("giga", 1_000_000_000),
    MEGA("mega", 1_000_000),
    KILO("kilo", 1_000),
    UNIT("", 1);

    String prefix;
    long exponent;

    String getPrefix() {
        return prefix;
    }

    long getExponent() {
        return exponent;
    }

    Unit(String prefix, long exponent) {
        this.prefix = prefix;
        this.exponent = exponent;
    }

    static Unit forValue(long value) {
        for (Unit unit : Unit.values()) {
            if (value >= unit.getExponent()) {
                return unit;
            }
        }
        return UNIT;
    }
}