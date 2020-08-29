import CSymEngine

/**
 The base class for all symbols in SymEngine.
 
 Symbols are immutable, so you may as well use `let` for all declarations.
 */
public class Symbol: CustomStringConvertible,
                    ExpressibleByFloatLiteral,
                    ExpressibleByIntegerLiteral,
                    Equatable {
    
    
    //---------------------- Type Defs -----------------------
    
    // For ExpressibleByFloatLiteral
    public typealias FloatLiteralType = Double
    
    // For ExpressibleByIntegerLiteral
    public typealias IntegerLiteralType = Int
    
    //---------------------- Member Variables -----------------------
    
    // Stores the pointer to the basic_struct object in memory
    internal var pointer: UnsafeMutablePointer<basic_struct>?
    
    // Get a string representation of the Symbol.
    public var description: String {
        // Return string, or empty string if nil
        return self.string ?? ""
    }
    
    /**
    Get a string representation of the `Symbol`.

    - Returns: A  string representing the `Symbol`.
    */
    public var string: String? {
        // Get a pointer to char* buff
        let buffOpt: UnsafeMutablePointer<Int8>? = basic_str(self.pointer)
        if let buff = buffOpt {
            // Copy the buff so we can free it
            let str: String = String(cString: buff)
            // Free the string buff
            basic_str_free(buff)
            // Return the copy
            return str
        }
        
        // Failure case
        return nil
    }
    
    /**
    Get a latex representation of the `Symbol`.
     
     This will return `nil` when a member of `Self` contains a custom constant. If you were intending to have a `Symbol` with a custom name,
     then use `init?(name: String)` rather than `init?(const name: String)`.

    - Returns: A  latex representing the `Symbol`.
    */
    public var latex: String? {
        // Get a pointer to char* buff
        let buffOpt: UnsafeMutablePointer<Int8>? = basic_str_latex(self.pointer)
                if let buff = buffOpt {
            // Copy the buff so we can free it
            let str: String = String(cString: buff)
            // Free the string buff
            basic_str_free(buff)
            // Return the copy
            return str
        }
        
        // Failure case
        return nil
    }
    
    /**
    Get a mathml representation of the `Symbol`.
     
     This will return `nil` when a member of `Self` contains a custom constant. If you were intending to have a `Symbol` with a custom name,
     then use `init?(name: String)` rather than `init?(const name: String)`.

    - Returns: A  mathml representing the `Symbol`.
    */
    public var mathml: String? {
        // Get a pointer to char* buff
        let buffOpt: UnsafeMutablePointer<Int8>? = basic_str_mathml(self.pointer)
        if let buff = buffOpt {
            // Copy the buff so we can free it
            let str: String = String(cString: buff)
            // Free the string buff
            basic_str_free(buff)
            // Return the copy
            return str
        }
        
        // Failure case
        return nil
    }
    
    /**
    Get a ccode representation of the `Symbol`.

    - Returns: A  ccode representing the `Symbol`.
    */
    public var ccode: String? {
        // Get a pointer to char* buff
        let buffOpt: UnsafeMutablePointer<Int8>? = basic_str_ccode(self.pointer)
        if let buff = buffOpt {
            // Copy the buff so we can free it
            let str: String = String(cString: buff)
            // Free the string buff
            basic_str_free(buff)
            // Return the copy
            return str
        }
        
        // Failure case
        return nil
    }
    
    /**
    Get a jscode representation of the `Symbol`.

    - Returns: A jscode representing the `Symbol`.
    */
    public var jscode: String? {
        // Get a pointer to char* buff
        let buffOpt: UnsafeMutablePointer<Int8>? = basic_str_jscode(self.pointer)
        if let buff = buffOpt {
            // Copy the buff so we can free it
            let str: String = String(cString: buff)
            // Free the string buff
            basic_str_free(buff)
            // Return the copy
            return str
        }
        
        // Failure case
        return nil
    }
    
    
    //---------------------- Initializers -----------------------
    
    /**
     Allocate a new struct on the heap for `basic_struct`
     */
    internal init() {
        // Allocate new basic_struct on the heap
        self.pointer = basic_new_heap()
    }
    
    /**
    Free the memory for the basic structure.
     */
    deinit {
        // Free the pointer
        Symbol.free(self.pointer)
    }
    
    /**
    Initialize the `Symbol` using a `Double` real component, and an optional complex component.

    - Parameter _: The  value to initialize as.

    - Returns: A new string saying hello to `recipient`.
    */
    public convenience init(_ num: Double, i complexOpt: Double? = nil)  {
        // Allocate memory
        self.init()
        // Set the Symbol value to num.
        // We intentionally don't use checkReturn here because throwing exceptions
        // in an initilizer is problematic (i.e. we can't conform to ExpressibleByFloatLiteral
        // if we do. We rely on catching it later if there is a problem.
        real_double_set_d(self.pointer, num)
        
        // Handle the complex component if passed
        if let complex = complexOpt {
            // Initialize the complex component
            let doublePointer = basic_new_heap()
            // doublePointe has symbolic magnitude double
            real_double_set_d(doublePointer, complex)
            
            // Now have a complex symbolic value with magnitude complex
            let complexPointer = basic_new_heap()
            basic_mul(complexPointer, doublePointer, Constants.I.pointer)
            
            // Multiply by the current real value
            let newPointer = basic_new_heap()
            basic_add(newPointer, complexPointer, self.pointer)
            
            // We can now free self.pointer, doublePointer, and complexPointer
            // while letting self.pointer = newPointer
            Symbol.free(doublePointer)
            Symbol.free(complexPointer)
            Symbol.free(self.pointer)
            self.pointer = newPointer
        }
    }
    
    /**
    Initialize `Symbole` using an `Int` real component, and an optional complex component.

    - Parameter _: The `Int` to initialize to.
    */
    public convenience init(_ num: Int, i complexOpt: Int? = nil) {
        // Allocate memory
        self.init()
        // Initialize basic_struct to num
        integer_set_si(self.pointer, num)
        
        // Handle the complex component if passed
        if let complex = complexOpt {
            // Initialize the complex component
            let integerPointer = basic_new_heap()
            // doublePointe has symbolic magnitude double
            integer_set_si(integerPointer, complex)
            
            // Now have a complex symbolic value with magnitude complex
            let complexPointer = basic_new_heap()
            basic_mul(complexPointer, integerPointer, Constants.I.pointer)
            
            // Multiply by the current real value
            let newPointer = basic_new_heap()
            basic_add(newPointer, complexPointer, self.pointer)
            
            // We can now free self.pointer, doublePointer, and complexPointer
            // while letting self.pointer = newPointer
            Symbol.free(integerPointer)
            Symbol.free(complexPointer)
            Symbol.free(self.pointer)
            self.pointer = newPointer
        }
    }
    
    /**
    Initialize `Symbole` using an `UInt` real component, and an optional complex component.

    - Parameter _: The `UInt` to initialize to.
    */
    public convenience init(_ num: UInt, i complexOpt: UInt? = nil) {
        // Allocate memory
        self.init()
        // Initialize basic_struct to num
        integer_set_ui(self.pointer, num)
        
        // Handle the complex component if passed
        if let complex = complexOpt {
            // Initialize the complex component
            let integerPointer = basic_new_heap()
            // doublePointe has symbolic magnitude double
            integer_set_ui(integerPointer, complex)
            
            // Now have a complex symbolic value with magnitude complex
            let complexPointer = basic_new_heap()
            basic_mul(complexPointer, integerPointer, Constants.I.pointer)
            
            // Multiply by the current real value
            let newPointer = basic_new_heap()
            basic_add(newPointer, complexPointer, self.pointer)
            
            // We can now free self.pointer, doublePointer, and complexPointer
            // while letting self.pointer = newPointer
            Symbol.free(integerPointer)
            Symbol.free(complexPointer)
            Symbol.free(self.pointer)
            self.pointer = newPointer
        }
    }
    
    /**
    Initializer for `ExpressibleByFloatLiteral` protocol. Do not call this directly. This will initialize the symbol to a real value.
     
     Use this initializer by simply doing:
     
     ```swift
     let b: Symbol = 83.2
     ```

    - Parameter floatLiteral: The float literal to initialize to.
    */
    required public convenience init(floatLiteral value: Symbol.FloatLiteralType)  {
        // Call init(_ num: Double)
        self.init(value)
    }
    
    /**
    Initializer for `ExpressibleByIntegerLiteral` protocol. Do not call this directly. This will initialize the symbol to a real value.
     
     Use  this initializer by simply doing:
     
     ```swift
     let i: Symbol = 11
     ```

    - Parameter integerLiteral: The  integer  to  initialize to.
    */
    required public convenience init(integerLiteral value: Symbol.IntegerLiteralType) {
        // Call init(_ num: Int)
        self.init(value)
    }
    
    /**
    Initialize the `Symbol` by parsing the provided string. Results in an optional as the parsing may fail.
     
     It may be nice  to use `ExpressibleByStringLiteral`, but that doesn't allow a failable initializer.

    - Parameter parse: The `String` to parse.
    */
    public convenience init?(parse str: String) {
        // Allocate memory
        self.init()
        // Attempt to parse the string
        do {
            try checkReturn(basic_parse(self.pointer, str))
        } catch {
            return nil
        }
    }
    
    /**
    Initializer creates a new basic constant.

    - Parameter const: The name of the new constant
    */
    public convenience init(const name: String) {
        // Allocate heap
        self.init()
        // Assign to the string
        basic_const_set(self.pointer, name)
    }
    
    /**
    Initializer creates a new symbol with the given name.

    - Parameter name: The name of the new symbol
    */
    required public convenience init(name: String) {
        // Allocate heap
        self.init()
        // Assign to the string
        symbol_set(self.pointer, name)
    }
    
    /**
    Initializer creates a new symbol with the given name.
     
     This initializer has the same functionality as `init?(name: String)`.

    - Parameter _: The name of the new symbol
    */
    required public convenience init(_ name: String) {
        self.init(name: name)
    }
    
    //-------------------- Static Functions --------------------
    
    /**
    Free a pointer to a `basic_struct`.

    - Parameter _ : The pointer to free.
    */
    internal static func free(_ pointer: UnsafeMutablePointer<basic_struct>?) {
        // Free the pointer
        basic_free_heap(pointer)
    }
    
    /**
    Get the current version of the SymEngine C++ library, not of the wrapper.

    - Returns: A string representing the version in use.
    */
    public static var version: String {
        // Get a pointer to char* buff
        let buff: UnsafePointer<Int8> = symengine_version()
        // Copy the buff just for safety
        let str: String = String(cString: buff)
        // Return the copy
        return str
    }
}

/**
Get an ascii art representation of SymEngine.
 
 ```
  _____           _____         _
 |   __|_ _ _____|   __|___ ___|_|___ ___
 |__   | | |     |   __|   | . | |   | -_|
 |_____|_  |_|_|_|_____|_|_|_  |_|_|_|___|
       |___|               |___|
 ```

- Returns: An ascii art representation of SymEngine.
*/
public var asciiArt: String? {
    // Get a pointer to char* buff
    let buffOpt: UnsafeMutablePointer<Int8>? = ascii_art_str()
    if let buff = buffOpt {
        // Copy the buff so we can free it
        let str: String = String(cString: buff)
        // Free the string buff
        basic_str_free(buff)
        // Return the copy
        return str
    }
    
    // Failure case
    return nil
}
