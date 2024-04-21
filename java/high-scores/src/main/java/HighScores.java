import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

class HighScores {

    List<Integer> scores;

    public HighScores(List<Integer> highScores) {
        this.scores = highScores;
    }

    List<Integer> scores() {
        return this.scores;
    }

    Integer latest() {
        return scores.get(scores.size() - 1);
    }

    Integer personalBest() {
        return Collections.max(scores);
    }

    List<Integer> personalTopThree() {
        var sortedScores = new ArrayList<>(scores);
        Collections.sort(sortedScores, Comparator.reverseOrder());
        return sortedScores.subList(0, Math.min(3, scores.size()));
    }

}
