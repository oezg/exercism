export function toRna(strand: string): string {
  return strand.split('').map(x => abc[x]).join('');
}

const abc = new Map<string, string>([
  ['A', 'U'],
  ['C', 'G'],
  ['G', 'C'],
  ['T', 'A']
]);

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
