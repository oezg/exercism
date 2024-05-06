export class Matrix {
  rows_;
  columns_;

  constructor(s) {
    this.rows_ = s.split('\n').map(r => r.split(' ').map(Number));
    this.columns_ = this.rows_[0].map((_, i) => this.rows_.map(row => row[i]));
  }

  get rows() {
    return [...this.rows_];
  }

  get columns() {
    return [...this.columns_];
  }
}
