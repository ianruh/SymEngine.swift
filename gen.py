funcs = "expand neg abs erf erfc sin cos tan asin acos atan csc sec cot acsc asec acot sinh cosh tanh asinh acosh atanh csch sech coth acsch asech acoth lambertw zeta dirichlet_eta gamma loggamma sqrt cbrt exp log".split(
    " ")

for func in funcs:
    s = """
/**
 {} the given symbol.
 
 - Parameters _: The symbol to {}.
 
 - Returns: A new {}ed symbol.
 */
public func {}(_ symbol: Symbol) -> Symbol? {{
    let newSymbol = Symbol()
    
    do {{
        try checkReturn(basic_{}(newSymbol.pointer, symbol.pointer))
    }} catch {{
        return nil
    }}
    return newSymbol
}}""".format(func, func, func, func, func)
    print(s)
