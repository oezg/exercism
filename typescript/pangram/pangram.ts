export function isPangram(text: string): boolean {
  const lowerCaseText = text.toLowerCase();
  return letters.every(c => lowerCaseText.toLowerCase().includes(c));
}

const letters = Array.from('abcdefghijklmnopqrstuvwxyz');