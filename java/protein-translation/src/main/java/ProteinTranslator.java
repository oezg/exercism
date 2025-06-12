import static java.util.Map.entry;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

class ProteinTranslator {

  private static final String STOP = "STOP";
  private static final int CODON_SIZE = 3;

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

  List<String> translate(String rnaSequence) {
    List<String> protein = new ArrayList<>();
    for (int i = 0; i < rnaSequence.length(); i += CODON_SIZE) {
      try {
        String codon = rnaSequence.substring(i, i + CODON_SIZE);
        String aminoAcid = aminoAcids.get(codon);
        if (aminoAcid == STOP) {
          break;
        }
        if (aminoAcid == null) {
          throw new IllegalArgumentException("Invalid codon");
        }
        protein.add(aminoAcid);
      } catch (StringIndexOutOfBoundsException e) {
        throw new IllegalArgumentException("Invalid codon");
      }
    }
    return protein;
  }
}
