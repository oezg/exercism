export const toRna = (dna) => [...dna].map(nucleotide => {
  switch(nucleotide) {
    case 'G': return 'C';
    case 'C': return 'G';
    case 'T': return 'A';
    case 'A': return 'U';
  };
}).join('');
