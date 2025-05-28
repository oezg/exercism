import java.util.HashMap;
import java.util.Map;

public class DialingCodes {
    private Map<Integer, String> code2country = new HashMap<>();
    private Map<String, Integer> country2code = new HashMap<>();

    public Map<Integer, String> getCodes() {
        return code2country;
    }

    public void setDialingCode(Integer code, String country) {
        code2country.put(code, country);
        country2code.put(country, code);
    }

    public String getCountry(Integer code) {
        return code2country.get(code);
    }

    public void addNewDialingCode(Integer code, String country) {
        if (code2country.containsKey(code) || country2code.containsKey(country)) {
            return;
        }
        setDialingCode(code, country);
    }

    public Integer findDialingCode(String country) {
        return country2code.get(country);
    }

    public void updateCountryDialingCode(Integer code, String country) {
        Integer oldCode = findDialingCode(country);
        if (oldCode == null) {
            return;
        }
        code2country.remove(oldCode);
        country2code.remove(country);
        setDialingCode(code, country);
    }
}
