import java.util.HashMap;
import java.util.Map;

class SqueakyClean {
    static String clean(String identifier) {
        StringBuilder sBuilder = new StringBuilder();
        boolean kebapCase = false;
        
        for (int index = 0; index < identifier.length(); index++) {
            char currentChar = identifier.charAt(index);
            char modifiedChar;
            if (currentChar == '-') {
                kebapCase = true;
                continue;
            }
            
            if (currentChar == ' ') {
                modifiedChar = '_';
            } else if (currentChar == '0') {
                modifiedChar = 'o';
            } else if (currentChar == '1') {
                modifiedChar = 'l';
            } else if (currentChar == '3') {
                modifiedChar = 'e';
            } else if (currentChar == '4') {
                modifiedChar = 'a';
            } else if (currentChar == '7') {
                modifiedChar = 't';
            } else if (!Character.isLetter(currentChar)) {
                continue;
            } else {
                modifiedChar = currentChar;
            }

            if (kebapCase) {
                modifiedChar = Character.toUpperCase(modifiedChar);
                kebapCase = false;
            }
            sBuilder.append(modifiedChar);
        }

        return sBuilder.toString();
    }
}
