import SymEngine

let x = Symbol(name: "x")!
let y = Symbol(name: "y")!

let exp = 3*y/(2*x**4)
print("Expression is: \(exp)")

print(diff(of: exp, withRespectTo: x)!.string!)

let exp2 = (x+y**2 - 9)**2
print(expand(exp2)!.string!)

let exp3 = cos(x)*sin(x)*cos(x)*x
print(exp3!.string!)
