import SymEngine

print(SymEngine.asciiArt)
let x = Basic(symbol: "x")
let y = Basic(symbol: "y")

let result = try! diff(of: 3*y**2 - log(x)*cos(x), withRespectTo: x)

print("Derivative of 3y^2 - log(x)cos(x)    -->    \(result.string!)")
print("\nOr in LATEX: \(result.latex!)")

let cubicStr = "(3x +2)*(x^2-7x+9)*(x-1)"
let cubic = Basic(parse: cubicStr)!
print("\nexpand( \(cubicStr) )    -->    \(try! expand(cubic))")




print("##############################################################")

let mat: Matrix = [[x, y],[y, x]]

print((mat + mat).string!)
