export function toRna(strand: string): string {
  return strand.split('').map(complement).join('');
}
 const complement = (base: string): string => {
  switch (base) {
    case 'A':
      return 'U';
    case 'C':
      return 'G';
    case 'G':
      return 'C';
    case 'T':
      return 'A';
    default:
      throw new Error('Invalid input DNA.');
  }
 }
