class RnaTranscription {

    String transcribe(String dnaStrand) {
        var sb = new StringBuilder(dnaStrand.length());
        for (char nucleotide : dnaStrand.toCharArray()) {
            sb.append(
                    switch (nucleotide) {
                        case 'A' -> 'U';
                        case 'C' -> 'G';
                        case 'G' -> 'C';
                        case 'T' -> 'A';
                        default -> throw new IllegalArgumentException(dnaStrand);
                    });
        }
        return sb.toString();
    }

}
