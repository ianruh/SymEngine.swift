import CSymEngine

/**
 The base class for all basics in SymEngine.
 
 Basics are immutable, so you may as well use `let` for all declarations.
 */
public class Basic: CustomStringConvertible,
                    ExpressibleByFloatLiteral,
                    ExpressibleByIntegerLiteral,
                    Equatable,
                    Hashable {
    
    
    //---------------------- Type Defs -----------------------
    
    // For ExpressibleByFloatLiteral
    public typealias FloatLiteralType = Double
    
    // For ExpressibleByIntegerLiteral
    public typealias IntegerLiteralType = Int
    
    //---------------------- Member Variables -----------------------
    
    // Stores the pointer to the basic_struct object in memory
    internal var pointer: UnsafeMutablePointer<basic_struct>?
    
    // Get a string representation of the Basic.
    public var description: String {
        // Return string, or empty string if nil
        return self.string ?? ""
    }
    
    /**
    Get a string representation of the `Basic`.

    - Returns: A  string representing the `Basic`.
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
    Get a latex representation of the `Basic`.
     
     This will return `nil` when a member of `Self` contains a custom constant. If you were intending to have a `Basic` with a custom name,
     then use `init?(name: String)` rather than `init?(const name: String)`.

    - Returns: A  latex representing the `Basic`.
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
    Get a mathml representation of the `Basic`.
     
     This will return `nil` when a member of `Self` contains a custom constant. If you were intending to have a `Basic` with a custom name,
     then use `init?(name: String)` rather than `init?(const name: String)`.

    - Returns: A  mathml representing the `Basic`.
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
    Get a ccode representation of the `Basic`.

    - Returns: A  ccode representing the `Basic`.
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
    Get a jscode representation of the `Basic`.

    - Returns: A jscode representing the `Basic`.
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


    public var isNumber: Bool {
        let result: Int32 = is_a_Number(self.pointer)
        return result == 1 ? true : false
    }

    public var isSymbol: Bool {
        let result: Int32 = is_a_Symbol(self.pointer)
        return result == 1 ? true : false
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
        Basic.free(self.pointer)
    }
    
    /**
    Initialize the `Basic` using a `Double` real component, and an optional complex component.

    - Parameter _: The  value to initialize as.

    - Returns: A new string saying hello to `recipient`.
    */
    public convenience init(_ num: Double, i complexOpt: Double? = nil)  {
        // Allocate memory
        self.init()
        // Set the Basic value to num.
        // We intentionally don't use checkReturn here because throwing exceptions
        // in an initilizer is problematic (i.e. we can't conform to ExpressibleByFloatLiteral
        // if we do. We rely on catching it later if there is a problem.
        real_double_set_d(self.pointer, num)
        
        // Handle the complex component if passed
        if let complex = complexOpt {
            // Initialize the complex component
            let doublePointer = basic_new_heap()
            // doublePointe has basicic magnitude double
            real_double_set_d(doublePointer, complex)
            
            // Now have a complex basicic value with magnitude complex
            let complexPointer = basic_new_heap()
            basic_mul(complexPointer, doublePointer, Constants.I.pointer)
            
            // Multiply by the current real value
            let newPointer = basic_new_heap()
            basic_add(newPointer, complexPointer, self.pointer)
            
            // We can now free self.pointer, doublePointer, and complexPointer
            // while letting self.pointer = newPointer
            Basic.free(doublePointer)
            Basic.free(complexPointer)
            Basic.free(self.pointer)
            self.pointer = newPointer
        }
    }
    
    /**
    Initialize `Basice` using an `Int` real component, and an optional complex component.

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
            // doublePointe has basicic magnitude double
            integer_set_si(integerPointer, complex)
            
            // Now have a complex basicic value with magnitude complex
            let complexPointer = basic_new_heap()
            basic_mul(complexPointer, integerPointer, Constants.I.pointer)
            
            // Multiply by the current real value
            let newPointer = basic_new_heap()
            basic_add(newPointer, complexPointer, self.pointer)
            
            // We can now free self.pointer, doublePointer, and complexPointer
            // while letting self.pointer = newPointer
            Basic.free(integerPointer)
            Basic.free(complexPointer)
            Basic.free(self.pointer)
            self.pointer = newPointer
        }
    }
    
    /**
    Initialize `Basice` using an `UInt` real component, and an optional complex component.

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
            // doublePointe has basicic magnitude double
            integer_set_ui(integerPointer, complex)
            
            // Now have a complex basicic value with magnitude complex
            let complexPointer = basic_new_heap()
            basic_mul(complexPointer, integerPointer, Constants.I.pointer)
            
            // Multiply by the current real value
            let newPointer = basic_new_heap()
            basic_add(newPointer, complexPointer, self.pointer)
            
            // We can now free self.pointer, doublePointer, and complexPointer
            // while letting self.pointer = newPointer
            Basic.free(integerPointer)
            Basic.free(complexPointer)
            Basic.free(self.pointer)
            self.pointer = newPointer
        }
    }
    
    /**
    Initializer for `ExpressibleByFloatLiteral` protocol. Do not call this directly. This will initialize the basic to a real value.
     
     Use this initializer by simply doing:
     
     ```swift
     let b: Basic = 83.2
     ```

    - Parameter floatLiteral: The float literal to initialize to.
    */
    required public convenience init(floatLiteral value: Basic.FloatLiteralType)  {
        // Call init(_ num: Double)
        self.init(value)
    }
    
    /**
    Initializer for `ExpressibleByIntegerLiteral` protocol. Do not call this directly. This will initialize the basic to a real value.
     
     Use  this initializer by simply doing:
     
     ```swift
     let i: Basic = 11
     ```

    - Parameter integerLiteral: The  integer  to  initialize to.
    */
    required public convenience init(integerLiteral value: Basic.IntegerLiteralType) {
        // Call init(_ num: Int)
        self.init(value)
    }
    
    /**
    Initialize the `Basic` by parsing the provided string. Results in an optional as the parsing may fail.
     
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
    Initializer creates a new basic with the given name.

    - Parameter name: The name of the new basic
    */
    public convenience init(symbol name: String) {
        // Allocate heap
        self.init()
        // Assign to the string
        symbol_set(self.pointer, name)
    }
    
    /**
    Initializer creates a new basic with the given name.
     
     This initializer has the same functionality as `init?(name: String)`.

    - Parameter _: The name of the new basic
    */
    public convenience init(_ name: String) {
        self.init(symbol: name)
    }

    //------------------ Hashable Conformance ------------------

    public func hash(into hasher: inout Hasher) {
        let hashValue: size_t = basic_hash(self.pointer)
        hasher.combine(hashValue)
    }

    /**
     Implement the required function for the `Equatable` protocol.
     */
    public static func == (lhs: Basic, rhs: Basic) -> Bool {
        return basic_eq(lhs.pointer, rhs.pointer) == 1 ? true : false
    }

    //------------------- Other  Functions -------------------------

    public func replace(_ original: Basic, with replacement: Basic) throws -> Basic {
        let newBasic = Basic()
        try checkReturn(basic_subs2(newBasic.pointer,
                                    self.pointer,
                                    original.pointer,
                                    replacement.pointer))
        return newBasic
    }

    public func getCoefficient(ofVariable variable: Basic,
                               withDegreee degree: Basic) throws -> Basic {
        let newBasic = Basic()
        try checkReturn(basic_coeff(newBasic.pointer,
                                    self.pointer,
                                    variable.pointer,
                                    degree.pointer))
        return newBasic
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
}
