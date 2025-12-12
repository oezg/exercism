import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.BeforeEach;

import static org.assertj.core.api.Assertions.assertThat;


public class BobTest {
    private Bob bob;

    @BeforeEach
    public void setUp() {
        bob = new Bob();
    }

    @Test
    @DisplayName("stating something")
    public void saySomething() {
        assertThat(bob.hey("Tom-ay-to, tom-aaaah-to."))
                .isEqualTo("Whatever.");
    }

    @Test
    @DisplayName("shouting")
    public void shouting() {
        assertThat(bob.hey("WATCH OUT!"))
                .isEqualTo("Whoa, chill out!");
    }

    @Test
    @DisplayName("shouting gibberish")
    public void shoutingGibberish() {
        assertThat(bob.hey("FCECDFCAAB"))
                .isEqualTo("Whoa, chill out!");
    }

    @Test
    @DisplayName("asking a question")
    public void askingAQuestion() {
        assertThat(bob.hey("Does this cryogenic chamber make me look fat?"))
                .isEqualTo("Sure.");
    }

    @Test
    @DisplayName("asking a numeric question")
    public void askingANumericQuestion() {
        assertThat(bob.hey("You are, what, like 15?"))
                .isEqualTo("Sure.");
    }

    @Test
    @DisplayName("asking gibberish")
    public void askingGibberish() {
        assertThat(bob.hey("fffbbcbeab?"))
                .isEqualTo("Sure.");
    }

    @Test
    @DisplayName("talking forcefully")
    public void talkingForcefully() {
        assertThat(bob.hey("Hi there!"))
                .isEqualTo("Whatever.");
    }

    @Test
    @DisplayName("using acronyms in regular speech")
    public void usingAcronymsInRegularSpeech() {
        assertThat(bob.hey("It's OK if you don't want to go work for NASA."))
                .isEqualTo("Whatever.");
    }

    @Test
    @DisplayName("forceful question")
    public void forcefulQuestions() {
        assertThat(bob.hey("WHAT'S GOING ON?"))
                .isEqualTo("Calm down, I know what I'm doing!");
    }

    @Test
    @DisplayName("shouting numbers")
    public void shoutingNumbers() {
        assertThat(bob.hey("1, 2, 3 GO!"))
                .isEqualTo("Whoa, chill out!");
    }

    @Test
    @DisplayName("no letters")
    public void onlyNumbers() {
        assertThat(bob.hey("1, 2, 3"))
                .isEqualTo("Whatever.");
    }

    @Test
    @DisplayName("question with no letters")
    public void questionWithOnlyNumbers() {
        assertThat(bob.hey("4?"))
                .isEqualTo("Sure.");
    }

    @Test
    @DisplayName("shouting with special characters")
    public void shoutingWithSpecialCharacters() {
        assertThat(bob.hey("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"))
                .isEqualTo("Whoa, chill out!");
    }

    @Test
    @DisplayName("shouting with no exclamation mark")
    public void shoutingWithNoExclamationMark() {
        assertThat(bob.hey("I HATE THE DENTIST"))
                .isEqualTo("Whoa, chill out!");
    }

    @Test
    @DisplayName("statement containing question mark")
    public void statementContainingQuestionMark() {
        assertThat(bob.hey("Ending with ? means a question."))
                .isEqualTo("Whatever.");
    }

    @Test
    @DisplayName("non-letters with question")
    public void nonLettersWithQuestion() {
        assertThat(bob.hey(":) ?"))
                .isEqualTo("Sure.");
    }

    @Test
    @DisplayName("prattling on")
    public void prattlingOn() {
        assertThat(bob.hey("Wait! Hang on. Are you going to be OK?"))
                .isEqualTo("Sure.");
    }

    @Test
    @DisplayName("silence")
    public void silence() {
        assertThat(bob.hey(""))
                .isEqualTo("Fine. Be that way!");
    }

    @Test
    @DisplayName("prolonged silence")
    public void prolongedSilence() {
        assertThat(bob.hey("          "))
                .isEqualTo("Fine. Be that way!");
    }

    @Test
    @DisplayName("alternate silence")
    public void alternateSilence() {
        assertThat(bob.hey("\t\t\t\t\t\t\t\t\t\t"))
                .isEqualTo("Fine. Be that way!");
    }

    @Test
    @DisplayName("starting with whitespace")
    public void startingWithWhitespace() {
        assertThat(bob.hey("         hmmmmmmm..."))
                .isEqualTo("Whatever.");
    }

    @Test
    @DisplayName("ending with whitespace")
    public void endingWithWhiteSpace() {
        assertThat(bob.hey("Okay if like my  spacebar  quite a bit?   "))
                .isEqualTo("Sure.");
    }

    @Test
    @DisplayName("other whitespace")
    public void otherWhiteSpace() {
        assertThat(bob.hey("\n\r \t"))
                .isEqualTo("Fine. Be that way!");
    }

    @Test
    @DisplayName("non-question ending with whitespace")
    public void nonQuestionEndingWithWhiteSpace() {
        assertThat(bob.hey("This is a statement ending with whitespace      "))
                .isEqualTo("Whatever.");
    }

    @Test
    @DisplayName("multiple line question")
    public void multipleLineQuestion() {
        assertThat(bob.hey("\nDoes this cryogenic chamber make\n me look fat?"))
                .isEqualTo("Sure.");
    }

}
