FROM jupyter/base-notebook:177037d09156

USER root

RUN apt-get update && apt-get -qy build-dep pari && apt-get install libreadline-dev libgmp-dev && apt-get clean

USER $NB_UID

RUN wget https://pari.math.u-bordeaux.fr/pub/pari/unstable/pari-2.12.0.alpha.tar.gz                              && \
    tar xf pari-2.12.0.alpha.tar.gz         && \
    cd pari-2.12.0.alpha                    && \
    ./Configure --prefix=GPDIR --mt=pthread && \
    make -j4 gp                             && \
    make doc                                && \
    make install
#    && \
#    make install-bin-sta

#RUN pip install pari_jupyter

COPY --chown=1000:100 . ${HOME}
