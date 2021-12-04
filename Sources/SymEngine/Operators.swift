//
//  Operators.swift
//  SymEngine
//
//  Created by Ian Ruh on 4/24/20.
//

/*
 The non-optional and optional functions are so we can avoid excessive
 optional chaining when actually using them. The downside is the final
 result of most calulcations will almost always be optional and need
 to be unwrapped.
 */

import CSymEngine

//------------------------- Custom Precedence --------------------

// New precidence for power
precedencegroup ExponentiationPrecedence {
    associativity: right
    higherThan: MultiplicationPrecedence
}



//------------------------- Custom Operators --------------------

infix operator ** : ExponentiationPrecedence
infix operator **= : AssignmentPrecedence

//------------------------- Basic Extension --------------------
    
/**
 The + operator adds two basics.
 - Returns: The new basic.
 */
public func + (lhs: Basic, rhs: Basic) -> Basic {
    let new = Basic()
    basic_add(new.pointer, lhs.pointer, rhs.pointer)
    return new
}

/**
The + operator adds two optional (or one optional and one not optional) basics and returns an optional.
 
 - Returns: The new optional basic.
*/
public func + (lhs: Basic?, rhs: Basic?) -> Basic? {
    guard let lhsU = lhs else {
        return nil
    }
    guard let rhsU = rhs else {
        return nil
    }
    
    let new = Basic()
    basic_add(new.pointer, lhsU.pointer, rhsU.pointer)
    return new
}

/**
The += operator adds two basics while mutating the first.
*/
public func += (lhs: inout Basic, rhs: Basic) {
    let new = Basic()
    basic_add(new.pointer, lhs.pointer, rhs.pointer)
    lhs = new
}

/**
The - operator subtracts two basics.
 
 - Returns: The new basic.
*/
public func - (lhs: Basic, rhs: Basic) -> Basic {
    let new = Basic()
    basic_sub(new.pointer, lhs.pointer, rhs.pointer)
    return new
}

/**
The - operator subtracts two optional (or one optional and one not optional) basics and returns an optional.
 
 - Returns: The new optional basic.
*/
public func - (lhs: Basic?, rhs: Basic?) -> Basic? {
    guard let lhsU = lhs else {
        return nil
    }
    guard let rhsU = rhs else {
        return nil
    }
    
    let new = Basic()
    basic_sub(new.pointer, lhsU.pointer, rhsU.pointer)
    return new
}

/**
The -= operator subtracts two basics while mutating the first.
*/
public func -= (lhs: inout Basic, rhs: Basic) {
    let new = Basic()
    basic_sub(new.pointer, lhs.pointer, rhs.pointer)
    lhs = new
}

/**
The * operator multiplies two basics.
 
 - Returns: The new basic.
*/
public func * (lhs: Basic, rhs: Basic) -> Basic {
    let new = Basic()
    basic_mul(new.pointer, lhs.pointer, rhs.pointer)
    return new
}

/**
The * operator multiplies two optional (or one optional and one not optional) basics and returns an optional.
 
 - Returns: The new optional basic.
*/
public func * (lhs: Basic?, rhs: Basic?) -> Basic? {
    guard let lhsU = lhs else {
        return nil
    }
    guard let rhsU = rhs else {
        return nil
    }
    
    let new = Basic()
    basic_mul(new.pointer, lhsU.pointer, rhsU.pointer)
    return new
}

/**
The *= operator multiplies two basics while mutating the first.
*/
public func *= (lhs: inout Basic, rhs: Basic) {
    let new = Basic()
    basic_mul(new.pointer, lhs.pointer, rhs.pointer)
    lhs = new
}

/**
The / operator divides two basics.
 
 - Returns: The new basic.
*/
public func / (lhs: Basic, rhs: Basic) -> Basic {
    let new = Basic()
    basic_div(new.pointer, lhs.pointer, rhs.pointer)
    return new
}

/**
The / operator divides two optional (or one optional and one not optional) basics and returns an optional.
 
 - Returns: The new optional basic.
*/
public func / (lhs: Basic?, rhs: Basic?) -> Basic? {
    guard let lhsU = lhs else {
        return nil
    }
    guard let rhsU = rhs else {
        return nil
    }
    
    let new = Basic()
    basic_div(new.pointer, lhsU.pointer, rhsU.pointer)
    return new
}

/**
The /= operator divides two basics while mutating the first.
*/
public func /= (lhs: inout Basic, rhs: Basic) {
    let new = Basic()
    basic_div(new.pointer, lhs.pointer, rhs.pointer)
    lhs = new
}

/**
The ** operator takes the left side to the power of the right side.
 
 - Returns: The new basic.
*/
public func ** (lhs: Basic, rhs: Basic) -> Basic {
    let new = Basic()
    basic_pow(new.pointer, lhs.pointer, rhs.pointer)
    return new
}

/**
The ** operator takes the power two optional (or one optional and one not optional) basics and returns an optional.
 
 - Returns: The new optional basic.
*/
public func ** (lhs: Basic?, rhs: Basic?) -> Basic? {
    guard let lhsU = lhs else {
        return nil
    }
    guard let rhsU = rhs else {
        return nil
    }
    
    let new = Basic()
    basic_pow(new.pointer, lhsU.pointer, rhsU.pointer)
    return new
}

/**
The **= operator takes the left side to the power of the right side while mutating the left side.
*/
public func **= (lhs: inout Basic, rhs: Basic) {
    let new = Basic()
    basic_pow(new.pointer, lhs.pointer, rhs.pointer)
    lhs = new
}

/**
The == operator compares the basicic equality of two basics.
 
 If either the left side or  the right side is nil, then  returns false.
 
 *Note*: This is what I want to do:
 
 ```swift
 if(lhs == nil || rhs == nil) {
     return false
 }
 return basic_eq(lhs_nonOpt.pointer, rhs_nonOpt.pointer) == 1 ? true : false
 ```
 
 But then it complains that "All paths through this function will call itself". So I resort to the existing ugly implementation.
 
 - Returns: Whether the left side is logically equal to the right side.
*/
public func == (lhs: Basic?, rhs: Basic?) -> Bool {
    if let lhs_nonOpt = lhs {
        if let rhs_nonOpt = rhs {
            return basic_eq(lhs_nonOpt.pointer, rhs_nonOpt.pointer) == 1 ? true : false
        }
    }
    return false
}

/**
The === operator compares two basics and returns whether they refer to the same basic object.
 
 If either the left side or  the right side is nil, then  returns false.
 
 - Returns: Whether the left side is the same basic the right side.
*/
public func === (lhs: Basic?, rhs: Basic?) -> Bool {
    if(lhs == nil || rhs == nil) {
        return false
    }
    return lhs!.pointer == rhs!.pointer
}

extension Basic {
    /**
     Implement the required function for the `Equatable` protocol.
     */
    public static func == (lhs: Basic, rhs: Basic) -> Bool {
        return basic_eq(lhs.pointer, rhs.pointer) == 1 ? true : false
    }
}
