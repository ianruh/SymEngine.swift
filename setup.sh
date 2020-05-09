#! /bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    cp pkgconfig/linux/symengine.pc /usr/lib/pkgconfig/
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/conda/lib/
elif [[ "$OSTYPE" == "darwin"* ]]; then
    cp pkgconfig/macOS/symengine.pc /usr/lib/pkgconfig/
    export PKG_CONFIG_PATH=/usr/local/anaconda3/lib/pkgconfig/:$PKG_CONFIG_PATH
    echo "export PKG_CONFIG_PATH=/usr/local/anaconda3/lib/pkgconfig/:$PKG_CONFIG_PATH" >> ~/.bashrc
fi