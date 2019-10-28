FROM jupyter/base-notebook:a97a294194ab

RUN sudo apt-get build-dep pari
RUN sudo apt-get install libreadline-dev libgmp-dev
RUN wget https://pari.math.u-bordeaux.fr/pub/pari/unstable/pari-2.12.0.alpha.tar.gz
RUN tar xf pari-2.12.0.alpha.tar.gz
RUN cd pari-2.12.0.alpha
RUN ./Configure --prefix=GPDIR --mt=pthread
RUN make -j4 gp
RUN make doc
RUN make install
RUN make install-bin-sta

COPY --chown=sage:sage . ${HOME}
