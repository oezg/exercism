export const isPangram = (sentence) =>
  asciiLower.every(c => sentence.toLowerCase().includes(c));

const asciiLower = new Array(26).fill(undefined).map((_, i) => String.fromCharCode(i + 97));
