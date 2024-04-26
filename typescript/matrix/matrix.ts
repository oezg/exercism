export class Matrix {
  rows_: number[][]
  columns_: number[][]

  constructor(s: string) {
    this.rows_ = s.split('\n').map(line => line.split(' ').map(x => +x));
    this.columns_ = this.rows_[0].map((_, colIndex) => this.rows_.map(row => row[colIndex]))
  }

  get rows(): number[][] {
    return this.deepCopy(this.rows_);
  }

  get columns(): number[][] {
    return this.deepCopy(this.columns_);
  }

  private readonly deepCopy = (matrix: number[][]): number[][] => JSON.parse(JSON.stringify(matrix));
}
