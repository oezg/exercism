import { forEach } from "core-js/core/array";

export class Matrix {
  constructor(s) {
    this.s = s;
  }

  get rows() {
    return this.s.split('\n').map(r => r.split(' ').map(c => Number(c)));
  }

  get columns() {
    const out = []
    forEach(this.rows, (row, idx, rws) => {
      out.push();
    })
  }
}
