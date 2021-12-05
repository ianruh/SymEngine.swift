import CSymEngine

/**
Take the derivative of a basic with  respect to the given basic.
 
- Parameter withRespectTo: The basic with respect to the derivative should be taken.

- Returns: A new basic representing the derivative of the current  `Basic`.
*/
public func diff(of basic: Basic, withRespectTo dBasic: Basic ) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_diff(newBasic.pointer,
                               basic.pointer,
                               dBasic.pointer))
    return newBasic
}

/**
 Expand the given basic.
 
 - Parameters _: The basic to expand.
 
 - Returns: A new expanded basic.
 */
public func expand(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_expand(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 Negate the given basic.
 
 - Parameters _: The basic to negate.
 
 - Returns: A new negated basic.
 */
public func neg(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_neg(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 Take the  absolute value  of the given basic.
 
 - Parameters _: The basic to take the absolute value of.
 
 - Returns: A new absolute  valued basic.
 */
public func abs(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_abs(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 Error function of the given basic.
 
 - Parameters _: The basic to take the error function of.
 
 - Returns: A new erfed basic.
 */
public func erf(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_erf(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 Take the complemntary error function of the given basic.
 
 - Parameters _: The basic to erfc.
 
 - Returns: A new erfced basic.
 */
public func erfc(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_erfc(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 Sine the given basic.
 
 - Parameters _: The basic to take sine of.
 
 - Returns: A new basic.
 */
public func sin(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_sin(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 Cosine the given basic.
 
 - Parameters _: The basic to take cosine of.
 
 - Returns: A new basic.
 */
public func cos(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_cos(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 Tangent of the given basic.
 
 - Parameters _: The basic to take the tangent of.
 
 - Returns: A new basic.
 */
public func tan(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_tan(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 Arcsine of the given basic.
 
 - Parameters _: The basic to take arcsin of.
 
 - Returns: A new basic.
 */
public func asin(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_asin(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 Arccosine the given basic.
 
 - Parameters _: The basic to take the arccosine of.
 
 - Returns: A new basic.
 */
public func acos(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_acos(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 Arctangent of the given basic.
 
 - Parameters _: The basic to take the arctangent of.
 
 - Returns: A new basic.
 */
public func atan(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_atan(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 Cosecant of the given basic.
 
 - Parameters _: The basic to take cosecant of.
 
 - Returns: A new basic.
 */
public func csc(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_csc(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 Sec of the given basic.
 
 - Parameters _: The basic to sec of.
 
 - Returns: A new basic.
 */
public func sec(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_sec(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 Cot of the given basic.
 
 - Parameters _: The basic to cot.
 
 - Returns: A new basic.
 */
public func cot(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_cot(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 Arccsc of the given basic.
 
 - Parameters _: The basic to arccsc.
 
 - Returns: A new basic.
 */
public func acsc(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_acsc(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 Arcsec the given basic.
 
 - Parameters _: The basic to take arcsec of.
 
 - Returns: A new basic.
 */
public func asec(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_asec(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 Arccot of the given basic.
 
 - Parameters _: The basic to arccot  of.
 
 - Returns: A new basic.
 */
public func acot(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_acot(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 Sinh of the given basic.
 
 - Parameters _: The basic to sinh.
 
 - Returns: A new basic.
 */
public func sinh(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_sinh(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 Cosh  of the given basic.
 
 - Parameters _: The basic to cosh.
 
 - Returns: A new basic.
 */
public func cosh(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_cosh(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 tanh the given basic.
 
 - Parameters _: The basic to tanh.
 
 - Returns: A new tanhed basic.
 */
public func tanh(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_tanh(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 asinh the given basic.
 
 - Parameters _: The basic to asinh.
 
 - Returns: A new asinhed basic.
 */
public func asinh(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_asinh(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 acosh the given basic.
 
 - Parameters _: The basic to acosh.
 
 - Returns: A new acoshed basic.
 */
public func acosh(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_acosh(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 atanh the given basic.
 
 - Parameters _: The basic to atanh.
 
 - Returns: A new atanhed basic.
 */
public func atanh(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_atanh(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 csch the given basic.
 
 - Parameters _: The basic to csch.
 
 - Returns: A new csched basic.
 */
public func csch(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_csch(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 sech the given basic.
 
 - Parameters _: The basic to sech.
 
 - Returns: A new seched basic.
 */
public func sech(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_sech(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 coth the given basic.
 
 - Parameters _: The basic to coth.
 
 - Returns: A new cothed basic.
 */
public func coth(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_coth(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 acsch the given basic.
 
 - Parameters _: The basic to acsch.
 
 - Returns: A new acsched basic.
 */
public func acsch(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_acsch(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 asech the given basic.
 
 - Parameters _: The basic to asech.
 
 - Returns: A new aseched basic.
 */
public func asech(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_asech(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 acoth the given basic.
 
 - Parameters _: The basic to acoth.
 
 - Returns: A new acothed basic.
 */
public func acoth(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_acoth(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 lambertw the given basic.
 
 - Parameters _: The basic to lambertw.
 
 - Returns: A new lambertwed basic.
 */
public func lambertw(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_lambertw(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 zeta the given basic.
 
 - Parameters _: The basic to zeta.
 
 - Returns: A new zetaed basic.
 */
public func zeta(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_zeta(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 dirichletEta of the given basic.
 
 - Parameters _: The basic to dirichlet_eta.
 
 - Returns: A new dirichlet_etaed basic.
 */
public func dirichletEta(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_dirichlet_eta(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 gamma the given basic.
 
 - Parameters _: The basic to gamma.
 
 - Returns: A new gammaed basic.
 */
public func gamma(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_gamma(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 loggamma the given basic.
 
 - Parameters _: The basic to loggamma.
 
 - Returns: A new loggammaed basic.
 */
public func loggamma(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_loggamma(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 sqrt the given basic.
 
 - Parameters _: The basic to sqrt.
 
 - Returns: A new sqrted basic.
 */
public func sqrt(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_sqrt(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 cbrt the given basic.
 
 - Parameters _: The basic to cbrt.
 
 - Returns: A new cbrted basic.
 */
public func cbrt(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_cbrt(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 exp the given basic.
 
 - Parameters _: The basic to exp.
 
 - Returns: A new exped basic.
 */
public func exp(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_exp(newBasic.pointer, basic.pointer))
    return newBasic
}

/**
 log the given basic.
 
 - Parameters _: The basic to log.
 
 - Returns: A new loged basic.
 */
public func log(_ basic: Basic) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(basic_log(newBasic.pointer, basic.pointer))
    return newBasic
}

