import CSymEngine

public class Basic: CustomStringConvertible,
                    ExpressibleByFloatLiteral {
    
    //---------------------- Type Defs -----------------------
    
    // For ExpressibleByFloatLiteral
    public typealias FloatLiteralType = Double
    
    //---------------------- Member Variables -----------------------
    
    // Stores the pointer to the basic_struct object in memory
    internal var pointer: UnsafeMutablePointer<basic_struct>?
    
    // Get a string representation of the basic.
    public var description: String {
        return self.getString()
    }
    
    //---------------------- Initializers -----------------------
    
    /**
     Allocate a new struct on the heap for `basic_struct`
     */
    public init() {
        // Allocate new basic_struct on the heap
        self.pointer = basic_new_heap()
    }
    
    /**
    Initialize the `Basic` using a `Double`.

    - Parameter _: The  value to initialize as.

    - Returns: A new string saying hello to `recipient`.
    */
    public convenience init(_ num: Double)  {
        // Allocate memory
        self.init()
        // Set the basic value to num.
        // We intentionally don't use checkReturn here because throwing exceptions
        // in an initilizer is problematic (i.e. we can't conform to ExpressibleByFloatLiteral
        // if we do. We rely on catching it later if there is a problem.
        real_double_set_d(self.pointer, num)
    }
    
    /**
    Initialize the `Basic` by parsing the provided string. Results in an optional as the parsing may fail.

    - Parameter parse: The `String` to parse.
    */
    public convenience init?(_ str: String) {
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
    Initializer for `ExpressibleByFloatLiteral` protocol. Do not call this directly.
     
     Use this initializer by simple doing:
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
    Free the memory for the basic structure.
     */
    deinit {
        // Free the pointer
        basic_free_heap(self.pointer)
    }
    
    //-------------------- Static Functions --------------------
    
    public static func getVersion() -> String {
        // Get a pointer to char* buff
        let buff: UnsafePointer<Int8> = symengine_version()
        // Copy the buff just for safety
        let str: String = String(cString: buff)
        // Return the copy
        return str
    }
    
    //-------------------- Instance Functions --------------------
    /**
    Get a string representation of the `Basic`.

    - Returns: A  string representing the `Basic`. If a string  could not be obtained, then an empty string is returned.
    */
    public func getString() -> String {
        // Get a pointer to char* buff
        let buffOpt: UnsafeMutablePointer<Int8>? = basic_str(self.pointer)
        
        if let buff = buffOpt {
            // Return a copy of the string if we got a non-null pointer
            
            // Copy the buff so we can free it
            let str: String = String(cString: buff)
            // Free the string buff
            basic_str_free(buff)
            // Return the copy
            return str
        } else {
            // Return an empty string if we got a null pointer
            return String()
        }
    }
}
