import static java.util.Map.entry;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.regex.Pattern;

class ProteinTranslator {
  private static final int CODON_SIZE = 3;
  private static final String CODON_REGEX = String.format("(?<=\\G.{%d})", CODON_SIZE);
  private static final Pattern CODON_PATTERN = Pattern.compile(CODON_REGEX);
  private static final String STOP = "STOP";

  private static final Map<String, String> aminoAcids =
      Map.ofEntries(
          entry("AUG", "Methionine"),
          entry("UUU", "Phenylalanine"),
          entry("UUC", "Phenylalanine"),
          entry("UUA", "Leucine"),
          entry("UUG", "Leucine"),
          entry("UCU", "Serine"),
          entry("UCC", "Serine"),
          entry("UCA", "Serine"),
          entry("UCG", "Serine"),
          entry("UAC", "Tyrosine"),
          entry("UAU", "Tyrosine"),
          entry("UGU", "Cysteine"),
          entry("UGC", "Cysteine"),
          entry("UGG", "Tryptophan"),
          entry("UAA", STOP),
          entry("UAG", STOP),
          entry("UGA", STOP));

  private static String codonToAminoAcid(String codon) {
    return Optional.ofNullable(aminoAcids.get(codon))
        .orElseThrow(() -> new IllegalArgumentException("Invalid codon"));
  }

  private static boolean notStopCodon(String aminoAcid) {
    return !STOP.equals(aminoAcid);
  }

  List<String> translate(String rnaSequence) {
    return CODON_PATTERN
        .splitAsStream(rnaSequence)
        .dropWhile(String::isEmpty)
        .map(ProteinTranslator::codonToAminoAcid)
        .takeWhile(ProteinTranslator::notStopCodon)
        .toList();
  }
}
