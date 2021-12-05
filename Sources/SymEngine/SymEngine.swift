import CSymEngine

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
public var asciiArt: String {
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
    return ""
}


/**
Get the current version of the SymEngine C++ library, not of the wrapper.

- Returns: A string representing the version in use.
*/
public var version: String {
    // Get a pointer to char* buff
    let buff: UnsafePointer<Int8> = symengine_version()
    // Copy the buff just for safety
    let str: String = String(cString: buff)
    // Return the copy
    return str
}
