class RnaTranscription {

    String transcribe(String dnaStrand) {
        var sb = new StringBuilder(dnaStrand.length());
        for (char nucleotide : dnaStrand.toCharArray()) {
            switch (nucleotide) {
                case 'A':
                    sb.append('U');
                    break;
                case 'C':
                    sb.append('G');
                    break;
                case 'G':
                    sb.append('C');
                    break;
                case 'T':
                    sb.append('A');
                    break;
                default:
                    throw new IllegalArgumentException(dnaStrand);
            }
        }
        return sb.toString();
    }

}
