
const giga = 1_000_000_000;

export const gigasecond = (date) => {
  return addSeconds(date, giga);
};

let addSeconds = (date, secs) => {
  return new Date(date.getTime() + secs * 1000);
}