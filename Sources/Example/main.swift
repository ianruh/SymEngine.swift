import SymEngine

print(SymEngine.asciiArt!)
let x = Basic(name: "x")
let y = Basic(name: "y")

let result = diff(of: 3*y**2 - log(x)*cos(x), withRespectTo: x)!

print("Derivative of 3y^2 - log(x)cos(x)    -->    \(result.string!)")
print("\nOr in LATEX: \(result.latex!)")

let cubicStr = "(3x +2)*(x^2-7x+9)*(x-1)"
let cubic = Basic(parse: cubicStr)!
print("\nexpand( \(cubicStr) )    -->    \(expand(cubic)!)")
