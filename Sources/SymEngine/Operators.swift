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

//------------------------- Symbol Extension --------------------
    
/**
 The + operator adds two symbols.
 - Returns: The new symbol.
 */
public func + (lhs: Symbol, rhs: Symbol) -> Symbol {
    let new = Symbol()
    basic_add(new.pointer, lhs.pointer, rhs.pointer)
    return new
}

/**
The + operator adds two optional (or one optional and one not optional) symbols and returns an optional.
 
 - Returns: The new optional symbol.
*/
public func + (lhs: Symbol?, rhs: Symbol?) -> Symbol? {
    guard let lhsU = lhs else {
        return nil
    }
    guard let rhsU = rhs else {
        return nil
    }
    
    let new = Symbol()
    basic_add(new.pointer, lhsU.pointer, rhsU.pointer)
    return new
}

/**
The += operator adds two symbols while mutating the first.
*/
public func += (lhs: inout Symbol, rhs: Symbol) {
    let new = Symbol()
    basic_add(new.pointer, lhs.pointer, rhs.pointer)
    lhs = new
}

/**
The - operator subtracts two symbols.
 
 - Returns: The new symbol.
*/
public func - (lhs: Symbol, rhs: Symbol) -> Symbol {
    let new = Symbol()
    basic_sub(new.pointer, lhs.pointer, rhs.pointer)
    return new
}

/**
The - operator subtracts two optional (or one optional and one not optional) symbols and returns an optional.
 
 - Returns: The new optional symbol.
*/
public func - (lhs: Symbol?, rhs: Symbol?) -> Symbol? {
    guard let lhsU = lhs else {
        return nil
    }
    guard let rhsU = rhs else {
        return nil
    }
    
    let new = Symbol()
    basic_sub(new.pointer, lhsU.pointer, rhsU.pointer)
    return new
}

/**
The -= operator subtracts two symbols while mutating the first.
*/
public func -= (lhs: inout Symbol, rhs: Symbol) {
    let new = Symbol()
    basic_sub(new.pointer, lhs.pointer, rhs.pointer)
    lhs = new
}

/**
The * operator multiplies two symbols.
 
 - Returns: The new symbol.
*/
public func * (lhs: Symbol, rhs: Symbol) -> Symbol {
    let new = Symbol()
    basic_mul(new.pointer, lhs.pointer, rhs.pointer)
    return new
}

/**
The * operator multiplies two optional (or one optional and one not optional) symbols and returns an optional.
 
 - Returns: The new optional symbol.
*/
public func * (lhs: Symbol?, rhs: Symbol?) -> Symbol? {
    guard let lhsU = lhs else {
        return nil
    }
    guard let rhsU = rhs else {
        return nil
    }
    
    let new = Symbol()
    basic_mul(new.pointer, lhsU.pointer, rhsU.pointer)
    return new
}

/**
The *= operator multiplies two symbols while mutating the first.
*/
public func *= (lhs: inout Symbol, rhs: Symbol) {
    let new = Symbol()
    basic_mul(new.pointer, lhs.pointer, rhs.pointer)
    lhs = new
}

/**
The / operator divides two symbols.
 
 - Returns: The new symbol.
*/
public func / (lhs: Symbol, rhs: Symbol) -> Symbol {
    let new = Symbol()
    basic_div(new.pointer, lhs.pointer, rhs.pointer)
    return new
}

/**
The / operator divides two optional (or one optional and one not optional) symbols and returns an optional.
 
 - Returns: The new optional symbol.
*/
public func / (lhs: Symbol?, rhs: Symbol?) -> Symbol? {
    guard let lhsU = lhs else {
        return nil
    }
    guard let rhsU = rhs else {
        return nil
    }
    
    let new = Symbol()
    basic_div(new.pointer, lhsU.pointer, rhsU.pointer)
    return new
}

/**
The /= operator divides two symbols while mutating the first.
*/
public func /= (lhs: inout Symbol, rhs: Symbol) {
    let new = Symbol()
    basic_div(new.pointer, lhs.pointer, rhs.pointer)
    lhs = new
}

/**
The ** operator takes the left side to the power of the right side.
 
 - Returns: The new symbol.
*/
public func ** (lhs: Symbol, rhs: Symbol) -> Symbol {
    let new = Symbol()
    basic_pow(new.pointer, lhs.pointer, rhs.pointer)
    return new
}

/**
The ** operator takes the power two optional (or one optional and one not optional) symbols and returns an optional.
 
 - Returns: The new optional symbol.
*/
public func ** (lhs: Symbol?, rhs: Symbol?) -> Symbol? {
    guard let lhsU = lhs else {
        return nil
    }
    guard let rhsU = rhs else {
        return nil
    }
    
    let new = Symbol()
    basic_pow(new.pointer, lhsU.pointer, rhsU.pointer)
    return new
}

/**
The **= operator takes the left side to the power of the right side while mutating the left side.
*/
public func **= (lhs: inout Symbol, rhs: Symbol) {
    let new = Symbol()
    basic_pow(new.pointer, lhs.pointer, rhs.pointer)
    lhs = new
}

/**
The == operator compares the symbolic equality of two symbols.
 
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
public func == (lhs: Symbol?, rhs: Symbol?) -> Bool {
    if let lhs_nonOpt = lhs {
        if let rhs_nonOpt = rhs {
            return basic_eq(lhs_nonOpt.pointer, rhs_nonOpt.pointer) == 1 ? true : false
        }
    }
    return false
}

/**
The === operator compares two symbols and returns whether they refer to the same symbol object.
 
 If either the left side or  the right side is nil, then  returns false.
 
 - Returns: Whether the left side is the same symbol the right side.
*/
public func === (lhs: Symbol?, rhs: Symbol?) -> Bool {
    if(lhs == nil || rhs == nil) {
        return false
    }
    return lhs!.pointer == rhs!.pointer
}

extension Symbol {
    /**
     Implement the required function for the `Equatable` protocol.
     */
    public static func == (lhs: Symbol, rhs: Symbol) -> Bool {
        return basic_eq(lhs.pointer, rhs.pointer) == 1 ? true : false
    }
}
