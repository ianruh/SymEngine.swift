import CSymEngine

/**
Take the derivative of a symbol with  respect to the given symbol.
 
 This function is non-mutating.

- Parameter withRespectTo: The symbol with respect to the derivative should be taken.

- Returns: A new symbol representing the derivative of the current  `Symbol`.
*/
public func diff(of symbol: Symbol, withRespectTo dSymbol: Symbol ) -> Symbol? {
    let newSymbol = Symbol()
    do {
        try checkReturn(basic_diff(newSymbol.pointer, symbol.pointer, dSymbol.pointer))
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
public func expand(_ symbol: Symbol) -> Symbol? {
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_expand(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 neg the given symbol.
 
 - Parameters _: The symbol to neg.
 
 - Returns: A new neged symbol.
 */
public func neg(_ symbol: Symbol) -> Symbol? {
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_neg(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 abs the given symbol.
 
 - Parameters _: The symbol to abs.
 
 - Returns: A new absed symbol.
 */
public func abs(_ symbol: Symbol) -> Symbol? {
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_abs(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 erf the given symbol.
 
 - Parameters _: The symbol to erf.
 
 - Returns: A new erfed symbol.
 */
public func erf(_ symbol: Symbol) -> Symbol? {
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_erf(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 erfc the given symbol.
 
 - Parameters _: The symbol to erfc.
 
 - Returns: A new erfced symbol.
 */
public func erfc(_ symbol: Symbol) -> Symbol? {
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_erfc(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 sin the given symbol.
 
 - Parameters _: The symbol to sin.
 
 - Returns: A new sined symbol.
 */
public func sin(_ symbol: Symbol) -> Symbol? {
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_sin(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 cos the given symbol.
 
 - Parameters _: The symbol to cos.
 
 - Returns: A new cosed symbol.
 */
public func cos(_ symbol: Symbol) -> Symbol? {
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_cos(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 tan the given symbol.
 
 - Parameters _: The symbol to tan.
 
 - Returns: A new taned symbol.
 */
public func tan(_ symbol: Symbol) -> Symbol? {
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_tan(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 asin the given symbol.
 
 - Parameters _: The symbol to asin.
 
 - Returns: A new asined symbol.
 */
public func asin(_ symbol: Symbol) -> Symbol? {
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_asin(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 acos the given symbol.
 
 - Parameters _: The symbol to acos.
 
 - Returns: A new acosed symbol.
 */
public func acos(_ symbol: Symbol) -> Symbol? {
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_acos(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 atan the given symbol.
 
 - Parameters _: The symbol to atan.
 
 - Returns: A new ataned symbol.
 */
public func atan(_ symbol: Symbol) -> Symbol? {
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_atan(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 csc the given symbol.
 
 - Parameters _: The symbol to csc.
 
 - Returns: A new csced symbol.
 */
public func csc(_ symbol: Symbol) -> Symbol? {
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_csc(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 sec the given symbol.
 
 - Parameters _: The symbol to sec.
 
 - Returns: A new seced symbol.
 */
public func sec(_ symbol: Symbol) -> Symbol? {
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_sec(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 cot the given symbol.
 
 - Parameters _: The symbol to cot.
 
 - Returns: A new coted symbol.
 */
public func cot(_ symbol: Symbol) -> Symbol? {
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_cot(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 acsc the given symbol.
 
 - Parameters _: The symbol to acsc.
 
 - Returns: A new acsced symbol.
 */
public func acsc(_ symbol: Symbol) -> Symbol? {
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_acsc(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 asec the given symbol.
 
 - Parameters _: The symbol to asec.
 
 - Returns: A new aseced symbol.
 */
public func asec(_ symbol: Symbol) -> Symbol? {
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_asec(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 acot the given symbol.
 
 - Parameters _: The symbol to acot.
 
 - Returns: A new acoted symbol.
 */
public func acot(_ symbol: Symbol) -> Symbol? {
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_acot(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 sinh the given symbol.
 
 - Parameters _: The symbol to sinh.
 
 - Returns: A new sinhed symbol.
 */
public func sinh(_ symbol: Symbol) -> Symbol? {
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_sinh(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

/**
 cosh the given symbol.
 
 - Parameters _: The symbol to cosh.
 
 - Returns: A new coshed symbol.
 */
public func cosh(_ symbol: Symbol) -> Symbol? {
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
public func tanh(_ symbol: Symbol) -> Symbol? {
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
public func asinh(_ symbol: Symbol) -> Symbol? {
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
public func acosh(_ symbol: Symbol) -> Symbol? {
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
public func atanh(_ symbol: Symbol) -> Symbol? {
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
public func csch(_ symbol: Symbol) -> Symbol? {
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
public func sech(_ symbol: Symbol) -> Symbol? {
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
public func coth(_ symbol: Symbol) -> Symbol? {
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
public func acsch(_ symbol: Symbol) -> Symbol? {
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
public func asech(_ symbol: Symbol) -> Symbol? {
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
public func acoth(_ symbol: Symbol) -> Symbol? {
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
public func lambertw(_ symbol: Symbol) -> Symbol? {
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
public func zeta(_ symbol: Symbol) -> Symbol? {
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
public func dirichletEta(_ symbol: Symbol) -> Symbol? {
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
public func gamma(_ symbol: Symbol) -> Symbol? {
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
public func loggamma(_ symbol: Symbol) -> Symbol? {
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
public func sqrt(_ symbol: Symbol) -> Symbol? {
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
public func cbrt(_ symbol: Symbol) -> Symbol? {
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
public func exp(_ symbol: Symbol) -> Symbol? {
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
public func log(_ symbol: Symbol) -> Symbol? {
    let newSymbol = Symbol()
    
    do {
        try checkReturn(basic_log(newSymbol.pointer, symbol.pointer))
    } catch {
        return nil
    }
    return newSymbol
}

