export const isPangram = (sentence) =>
  asciiLower.every(c => sentence.toLowerCase().includes(c));
  // new Set(sentence.toLowerCase()).isSupersetOf(new Set(asciiLower));

const asciiLower = Array.from({ length: 26 }, (_, i) => String.fromCharCode(i + 97));
