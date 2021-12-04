import CSymEngine

/**
 A private enum used internally for retrieving constants
 */
internal enum ConstantsEnum {
    case zero
    case one
    case negOne
    case I
    
    case pi
    case e
    case eulerGamma
    case catalan
    case goldenRatio
    
    case inf
    case negInf
    case complexInf
    
    case nan
}

/**
Struct for accessing fundamental constants.
 
 All of the members are declared static.
*/
public struct Constants {
    
    /**
     The constant zeros.
     */
    public static let zero = Basic.getConst(.zero)
    /**
    The constant one.
    */
    public static let one  = Basic.getConst(.one)
    /**
    The constant negative one.
    */
    public static let negOne = Basic.getConst(.negOne)
    /**
    The constant for sqrt(-1).
    */
    public static let I = Basic.getConst(.I)
    
    /**
    The constant pi.
    */
    public static let pi = Basic.getConst(.pi)
    /**
    The constant e.
    */
    public static let e = Basic.getConst(.e)
    /**
    The constant euler gamma.
    */
    public static let eulerGamma = Basic.getConst(.eulerGamma)
    /**
    The catalan constant.
    */
    public static let catalan = Basic.getConst(.catalan)
    /**
    The golden ratio.
    */
    public static let goldenRatio = Basic.getConst(.goldenRatio)
    
    /**
    A constant for infinity.
    */
    public static let inf = Basic.getConst(.inf)
    /**
    A constant or negative infinity.
    */
    public static let negInf = Basic.getConst(.negInf)
    /**
    A constant for complex infinity.
    */
    public static let complexInf = Basic.getConst(.complexInf)
    
    /**
    A constant nan.
    */
    public static let nan = Basic.getConst(.nan)
}

extension Basic {
    //---------------------- Constants -----------------------
    
    /**
     Internally used function to get a `Basic` for the given `ConstantEnum`

    - Parameter _: The constant to get.

    - Returns: A new constant `Basic` for the given constant.
    */
    internal static func getConst(_ const: ConstantsEnum) -> Basic {
        let b: Basic = Basic()
        
        // Call the relevant initializer
        switch(const) {
        case .zero:
            basic_const_zero(b.pointer)
        case .one:
            basic_const_one(b.pointer)
        case .negOne:
            basic_const_minus_one(b.pointer)
        case .I:
            basic_const_I(b.pointer)
        case .pi:
            basic_const_pi(b.pointer)
        case .e:
            basic_const_E(b.pointer)
        case .eulerGamma:
            basic_const_EulerGamma(b.pointer)
        case .catalan:
            basic_const_Catalan(b.pointer)
        case .goldenRatio:
            basic_const_GoldenRatio(b.pointer)
        case .inf:
            basic_const_infinity(b.pointer)
        case .negInf:
            basic_const_neginfinity(b.pointer)
        case .complexInf:
            basic_const_complex_infinity(b.pointer)
        case .nan:
            basic_const_nan(b.pointer)
        }
        // Return the Basic
        return b
    }
}
