FROM ubuntu:18.04

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion

RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

RUN apt-get install -y curl grep sed dpkg && \
    TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \
    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb && \
    dpkg -i tini.deb && \
    rm tini.deb && \
    apt-get clean

ENTRYPOINT [ "/usr/bin/tini", "--" ]

RUN apt install -y clang libicu-dev

RUN wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import -

RUN cd ~/ && wget --quiet https://swift.org/builds/swift-5.2.3-release/ubuntu1804/swift-5.2.3-RELEASE/swift-5.2.3-RELEASE-ubuntu18.04.tar.gz
RUN cd ~/ && tar xzf swift-5.2.3-RELEASE-ubuntu18.04.tar.gz
RUN echo "export PATH=/root/swift-5.2.3-RELEASE-ubuntu18.04/usr/bin:$PATH" >> ~/.bashrc

RUN conda install -y symengine -c conda-forge