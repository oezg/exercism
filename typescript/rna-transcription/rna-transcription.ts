export function toRna(strand: string): string {
  return strand.split('').map(complement).join('');
}

const rnaTranslationTable = new Map<string, string>([
  ['A', 'U'],
  ['C', 'G'],
  ['G', 'C'],
  ['T', 'A']
]);

const complement = (base: string): string => {
  const translation = rnaTranslationTable.get(base);
  if (translation === undefined)
    throw new Error('Invalid input DNA.');
  return translation;
}
