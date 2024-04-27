export class Gigasecond {
  date_: Date;

  constructor(start: Date) {
    this.date_ = new Date(start.getTime() + GIGA_SECONDS_MS);
  }

  public date(): Date {
    return this.date_;
  }
}

const GIGA_SECONDS_MS = 1_000_000_000 * 1_000;