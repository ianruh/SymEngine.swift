import SymEngine

print(SymEngine.asciiArt!)
let x = Symbol(name: "x")!
let y = Symbol(name: "y")!

print("x+x = \(x+x)\n")

let result = diff(of: 3*y**2 - log(x)*cos(x), withRespectTo: x)!

print("Derivative of 3y^2 - log(x)cos(x) = \(result.string!)")
print("\nAnd in MathML:\n\(result.mathml!)")
print("\nOr Latex: \(result.latex!)")

print(Symbol(parse: "3x^2 + 3*y"))
