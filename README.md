# SymEngine

 A swift wrapper for [SymEngine](https://github.com/symengine/symengine), a fast symbolic manipulation library, written in C++.

## Building

This is janky, but the only way I've found to work. If you know better (e.g. have any clue as to how to do this properly :smile: ) I would love to find out.

```
$ export PKG_CONFIG_PATH=/usr/local/anaconda3/lib/pkgconfig/
$ cp pkgconfig/symengine.pc /usr/local/anaconda3/lib/pkgconfig/
```

1. Install SymEngine using conda: 

   ```
   $ conda install symengine -c conda-forge
   ```

2. Run `swift build` *once* before actually building. It will fail, but ignore for now.

3. To actually build:

   ```
   $ swift build -Xcc -I/usr/local/anaconda3/include/ -Xlinker -L/usr/local/anaconda3/lib
   ```

4. Before you can run anything, you need to make sure that the dylibs can be found at runtime, so set the fallback dylib path:

   ```
   $ export DYLD_FALLBACK_LIBRARY_PATH=/usr/local/anaconda3/lib
   ```

5. Now you can run the executables:

   ```
   $ ./.build/x86_64-apple-macosx/debug/testExec
   ```

   :confetti_ball::confetti_ball:

## ToDo

- [ ] `TypeID` and getting the type
- [ ] 