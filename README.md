# SymEngine.swift [![Build Status](https://travis-ci.org/ianruh/SymEngine.swift.svg?branch=master)](https://travis-ci.org/ianruh/SymEngine.swift)

 A swift wrapper for [SymEngine](https://github.com/symengine/symengine), a :zap:fast:zap: symbolic manipulation library, written in C++. This wrapper isn't complete yet, but PRs are welcome! Documentation is avaible [here](https://ianruh.github.io/SymEngine.swift/).

## Quick Start

The easiest way to get started is via Docker. First clone the repository, then build and run the container using:

```
$ docker build -t symengine.swift .
$ docker run --rm -it symengine.swift /bin/bash
```

Once the conatiner is started, you can run the example using `swift run example`.


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

We can create symbols in several different ways:

```swift
// A symbol for a variable x
let x: Symbol? = Symbol(name: "x")

// A symbol for an integer.
let one: Symbol = 1
// or equivalently
let one = Symbol(1)

// A symbol for a double. Same thing as integer can be done
// to instantiate it explicitly.
let oneHalf: Symbol = 0.5

// Parse the expression
let expression: Symbol? = Symbol(parse: "3x^2 + 3*y")
```

However, notice that some of the symbols returned are optional as it is possible an initializer may fail. While the operations and functions in this wrapper have been designed to work with both optionals and non-optionals (returning non-optionals when possible), the compiler will yell at you until attention is paid to the optionality of the values you are working with.

Now we can do some math using these:

```swift
let quadratic = x**2 + 4*x +4
let derivative = diff(of: quadratic, withRespectTo: x)!
print(derivative)
// 4 + 2*x
```

Notice that the exponent is `**`, rather than `^`. Swift doesn't let you override the operators, so we can't copt the caret.

Head over to the [documentation](https://ianruh.github.io/SymEngine.swift/) for more information.

## Installing

1. Install SymEngine using conda: 

   ```
   $ conda install symengine -c conda-forge
   ```

2. The Swift Package Manager relies on `pkgconfig` for finding system libraries. Included in the repo are two pkgconfig files. If you installed SymEngine or anaconda (or used miniconda) to a different place, you may need to adjust them. Then, you can either add them to `PKG_CONFIG_PATH`, or copy  the pkgconfig file into a directory already in the path.

3. Before you can run anything, you need to make sure that the SymEngine library can be found at runtime. On macOS set the fallback dylib path:

   ```
   $ export DYLD_FALLBACK_LIBRARY_PATH=$DYLD_FALLBACK_LIBRARY_PATH:[path to libraries]
   ```

   On linux, look for the right way to add libraries to the system for your distro.

4. To test that the environment is setup correctly, clone the repository and run the tests.

   ```
   $ swift test
   ```

## Swift Package Manager

Add the following to your dependencies:

```swift
.package(url: "https://github.com/ianruh/SymEngine.swift.git", from: ...)
```

Check the tags for the most recent version.

## Notes

I have only implemented wrappers for the basic functions so far (no matrices or sets yet). I intend to implement them, but only needed the basics to begin with.