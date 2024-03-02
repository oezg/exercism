import { translate2d } from "./coordinate-transformation.js"


let z = translate2d(12,12)
let k = z(8,8)

console.log(k)