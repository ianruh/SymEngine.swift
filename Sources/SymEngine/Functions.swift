import CSymEngine

/**
Take the derivative of a symbol with  respect to the given symbol.
 
 This function is non-mutating.

- Parameter withRespectTo: The symbol with respect to the derivative should be taken.

- Returns: A new symbol representing the derivative of the current  `Symbol`.
*/
public func diff(of symbol: Symbol?, withRespectTo dSymbol: Symbol? ) -> Symbol? {
    // Handle optional inputs
    if(symbol == nil || dSymbol == nil) {
        return nil
    }
    
    let newSymbol = Symbol()
    do {
        try checkReturn(basic_diff(newSymbol.pointer, symbol!.pointer, dSymbol!.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 Expand the given symbol.
 
 - Parameters _: The symbol to expand.
 
 - Returns: A new expanded symbol.
 */
public func expand(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_expand(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 Negate the given symbol.
 
 - Parameters _: The symbol to negate.
 
 - Returns: A new negated symbol.
 */
public func neg(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_neg(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 Take the  absolute value  of the given symbol.
 
 - Parameters _: The symbol to take the absolute value of.
 
 - Returns: A new absolute  valued symbol.
 */
public func abs(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_abs(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 Error function of the given symbol.
 
 - Parameters _: The symbol to take the error function of.
 
 - Returns: A new erfed symbol.
 */
public func erf(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_erf(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 Take the complemntary error function of the given symbol.
 
 - Parameters _: The symbol to erfc.
 
 - Returns: A new erfced symbol.
 */
public func erfc(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_erfc(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 Sine the given symbol.
 
 - Parameters _: The symbol to take sine of.
 
 - Returns: A new symbol.
 */
public func sin(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_sin(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 Cosine the given symbol.
 
 - Parameters _: The symbol to take cosine of.
 
 - Returns: A new symbol.
 */
public func cos(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_cos(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 Tangent of the given symbol.
 
 - Parameters _: The symbol to take the tangent of.
 
 - Returns: A new symbol.
 */
public func tan(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_tan(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 Arcsine of the given symbol.
 
 - Parameters _: The symbol to take arcsin of.
 
 - Returns: A new symbol.
 */
public func asin(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_asin(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 Arccosine the given symbol.
 
 - Parameters _: The symbol to take the arccosine of.
 
 - Returns: A new symbol.
 */
public func acos(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_acos(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 Arctangent of the given symbol.
 
 - Parameters _: The symbol to take the arctangent of.
 
 - Returns: A new symbol.
 */
public func atan(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_atan(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 Cosecant of the given symbol.
 
 - Parameters _: The symbol to take cosecant of.
 
 - Returns: A new symbol.
 */
public func csc(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_csc(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 Sec of the given symbol.
 
 - Parameters _: The symbol to sec of.
 
 - Returns: A new symbol.
 */
public func sec(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_sec(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 Cot of the given symbol.
 
 - Parameters _: The symbol to cot.
 
 - Returns: A new symbol.
 */
public func cot(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_cot(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 Arccsc of the given symbol.
 
 - Parameters _: The symbol to arccsc.
 
 - Returns: A new symbol.
 */
public func acsc(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_acsc(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 Arcsec the given symbol.
 
 - Parameters _: The symbol to take arcsec of.
 
 - Returns: A new symbol.
 */
public func asec(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_asec(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 Arccot of the given symbol.
 
 - Parameters _: The symbol to arccot  of.
 
 - Returns: A new symbol.
 */
public func acot(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_acot(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 Sinh of the given symbol.
 
 - Parameters _: The symbol to sinh.
 
 - Returns: A new symbol.
 */
public func sinh(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_sinh(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 Cosh  of the given symbol.
 
 - Parameters _: The symbol to cosh.
 
 - Returns: A new symbol.
 */
public func cosh(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_cosh(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 tanh the given symbol.
 
 - Parameters _: The symbol to tanh.
 
 - Returns: A new tanhed symbol.
 */
public func tanh(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_tanh(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 asinh the given symbol.
 
 - Parameters _: The symbol to asinh.
 
 - Returns: A new asinhed symbol.
 */
public func asinh(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_asinh(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 acosh the given symbol.
 
 - Parameters _: The symbol to acosh.
 
 - Returns: A new acoshed symbol.
 */
public func acosh(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_acosh(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 atanh the given symbol.
 
 - Parameters _: The symbol to atanh.
 
 - Returns: A new atanhed symbol.
 */
public func atanh(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_atanh(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 csch the given symbol.
 
 - Parameters _: The symbol to csch.
 
 - Returns: A new csched symbol.
 */
public func csch(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_csch(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 sech the given symbol.
 
 - Parameters _: The symbol to sech.
 
 - Returns: A new seched symbol.
 */
public func sech(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_sech(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 coth the given symbol.
 
 - Parameters _: The symbol to coth.
 
 - Returns: A new cothed symbol.
 */
public func coth(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_coth(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 acsch the given symbol.
 
 - Parameters _: The symbol to acsch.
 
 - Returns: A new acsched symbol.
 */
public func acsch(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_acsch(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 asech the given symbol.
 
 - Parameters _: The symbol to asech.
 
 - Returns: A new aseched symbol.
 */
public func asech(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_asech(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 acoth the given symbol.
 
 - Parameters _: The symbol to acoth.
 
 - Returns: A new acothed symbol.
 */
public func acoth(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_acoth(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 lambertw the given symbol.
 
 - Parameters _: The symbol to lambertw.
 
 - Returns: A new lambertwed symbol.
 */
public func lambertw(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_lambertw(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 zeta the given symbol.
 
 - Parameters _: The symbol to zeta.
 
 - Returns: A new zetaed symbol.
 */
public func zeta(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_zeta(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 dirichletEta of the given symbol.
 
 - Parameters _: The symbol to dirichlet_eta.
 
 - Returns: A new dirichlet_etaed symbol.
 */
public func dirichletEta(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_dirichlet_eta(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 gamma the given symbol.
 
 - Parameters _: The symbol to gamma.
 
 - Returns: A new gammaed symbol.
 */
public func gamma(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_gamma(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 loggamma the given symbol.
 
 - Parameters _: The symbol to loggamma.
 
 - Returns: A new loggammaed symbol.
 */
public func loggamma(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_loggamma(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 sqrt the given symbol.
 
 - Parameters _: The symbol to sqrt.
 
 - Returns: A new sqrted symbol.
 */
public func sqrt(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_sqrt(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 cbrt the given symbol.
 
 - Parameters _: The symbol to cbrt.
 
 - Returns: A new cbrted symbol.
 */
public func cbrt(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_cbrt(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 exp the given symbol.
 
 - Parameters _: The symbol to exp.
 
 - Returns: A new exped symbol.
 */
public func exp(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_exp(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 log the given symbol.
 
 - Parameters _: The symbol to log.
 
 - Returns: A new loged symbol.
 */
public func log(_ symbolOpt: Symbol?) -> Symbol? {
    // Handle optional inputs
    guard let symbol = symbolOpt else {return nil}
    
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_log(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

