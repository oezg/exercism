export class Matrix {
  s: string
  rows_: number[][]
  columns_: number[][]

  constructor(s: string) {
    this.s = s;
    this.rows_= this.s.split('\n').map(line => line.split(' ').map(x => +x));
    this.columns_ = new Array(this.rows.length).fill(0).map(x => new Array(this.rows.length).fill(0));
    for (let index = 0; index < this.rows.length; index++) {
      const row = this.rows[index];
      for (let jindex = 0; jindex < row.length; jindex++) {
        const element = row[jindex];
        this.columns_[jindex][index] = element;
      }
    }
  }

  get rows(): number[][] {
    return this.rows_;
  }

  get columns(): number[][] {
    return JSON.parse(JSON.stringify(this.columns_));
  }
}
