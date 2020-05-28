# SymEngine

 A swift wrapper for [SymEngine](https://github.com/symengine/symengine), a fast symbolic manipulation library, written in C++.

## Installing

This is janky, but the only way I've found to work. If you know better I would love to find out.

1. Install SymEngine using conda: 

   ```
   $ conda install symengine -c conda-forge
   ```

2. The Swift Package Manager relies on `pkgconfig` for finding system libraries. Included in the repo are two pkgconfig files. If you installed SymEngine or anaconda to a different place, you may need to adjust them. Then, you can either set the `PKG_CONFIG_PATH` path, or copy  the pkgconfig file into a directory already in the path.

3. To actually build:

   ```
   $ swift build
   ```

4. Before you can run anything, you need to make sure that the dylibs can be found at runtime, so set the fallback dylib path:

   ```
   $ export DYLD_FALLBACK_LIBRARY_PATH=/usr/local/anaconda3/lib
   ```

5. Now you can run the example:

   ```
   $ ./.build/x86_64-apple-macosx/debug/example
   ```


## Getting Started

First import SymEngine:

```swift
import SymEngine
```

Then print the beautiful asci art:

```swift
print(SymEngine.asciiArt!)
//  _____           _____         _         
// |   __|_ _ _____|   __|___ ___|_|___ ___ 
// |__   | | |     |   __|   | . | |   | -_|
// |_____|_  |_|_|_|_____|_|_|_  |_|_|_|___|
//       |___|               |___|  
```

We can create some symbols in several different ways:

```swift
let x: Symbol? = Symbol(name: "x")
let one: Symbol = 1
let oneHalf: Symbol = 0.5
let expression: Symbol? = Symbol(parse: "3x^2 + 3*y")
```

However, notice that some of the symbols returned are optional as it is possible an initializer may fail. While the operations and functions in this wrapper have been designed to work with both optionals and non-optionals (returning non-optionals when possible), the compiler will yell at you until attention is paid to the optionality of the values you are working with.