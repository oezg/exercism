/**
 * Calculates a date that is one gigasecond (1,000,000,000 seconds) after the provided date.
 * 
 * @param {Date} date - The date to calculate the gigasecond from. 
 * @returns {Date} A new Date object representing the date one gigasecond after the input date. 
 */
export const gigasecond = (date) => new Date(date.getTime() + 1e12);