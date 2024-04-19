export function isPangram(text: string): boolean {
  return 'abcdefghijklmnopqrstuvwxyz'.split('').every(c => text.toLowerCase().includes(c));
}
