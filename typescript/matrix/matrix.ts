export class Matrix {
  s: string
  constructor(s: string) {
    this.s = s;
  }

  get rows(): Array<Array<number>> {
    return this.s.split('\n').map(line => line.split(' ').map(x => parseInt(x)));
  }

  get columns(): Array<Array<number>> {
    let cols = new Array(this.rows.length).fill(0).map(x => new Array(this.rows.length).fill(0));
    for (let index = 0; index < this.rows.length; index++) {
      const row = this.rows[index];
      for (let jindex = 0; jindex < row.length; jindex++) {
        const element = row[jindex];
        cols[jindex][index] = element;
      }
    }
    return cols;
  }
}
