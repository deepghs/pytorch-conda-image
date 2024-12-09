FROM runpod/pytorch:2.4.0-py3.11-cuda12.4.1-devel-ubuntu22.04

WORKDIR /data

RUN apt update && \
    apt install -y nano wget curl zip unzip rar unrar cloc htop tmux
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /data/miniconda.sh && \
    chmod +x /data/miniconda.sh
RUN /data/miniconda.sh -b -p /root/miniconda3
ENV PATH /root/miniconda3/bin:$PATH
RUN conda init bash && \
    conda clean -a -y && \
    conda install python=3.10 cudnn libcufft cuda-cudart && \
    conda clean -a -y
RUN conda --version

RUN ls -al /data

CMD [ "/start.sh" ]
