export class Gigasecond {
  start_: Date;

  constructor(start: Date) {
    this.start_ = start;
  }

  public date(): Date {
    return new Date(this.start_.getTime() + 1_000_000_000 * 1_000);
  }
}
