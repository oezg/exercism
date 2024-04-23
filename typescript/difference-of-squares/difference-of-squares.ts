export class Squares {
  sumOfSquares_: number
  squareOfSum_: number
  difference_: number

  constructor(n: number) {
    this.squareOfSum_ = Math.pow(n * (n + 1) / 2, 2)
    this.sumOfSquares_ = (n * (n + 1) * (2 * n + 1)) / 6
    this.difference_ = Math.abs(this.sumOfSquares_ - this.squareOfSum_)
  }

  get sumOfSquares(): number {
    return this.sumOfSquares_;
  }

  get squareOfSum(): number {
    return this.squareOfSum_;
  }

  get difference(): number {
    return this.difference_;
  }
}
