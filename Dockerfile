FROM swift:bionic

# install miniconda
ENV HOME=/root
ENV CONDA_DIR=$HOME/miniconda3
RUN apt update && apt install -y wget
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
RUN chmod +x ~/miniconda.sh
RUN ~/miniconda.sh -b -p $CONDA_DIR
RUN rm ~/miniconda.sh # make non-activate conda commands available
ENV PATH=$CONDA_DIR/bin:$PATH

# install symengine
RUN conda install symengine -c conda-forge

# copy the wrapper
COPY . $HOME/SymEngine.Swift/
ENV PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$HOME/SymEngine.Swift/pkgconfig/docker
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/root/miniconda3/lib

WORKDIR $HOME/SymEngine.Swift