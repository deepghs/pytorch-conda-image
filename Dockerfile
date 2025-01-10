FROM runpod/pytorch:2.4.0-py3.11-cuda12.4.1-devel-ubuntu22.04

WORKDIR /data

# Dependencies
RUN \
       apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y curl wget cloc make cmake tree telnet net-tools iputils-ping git axel

# system env
ENV LANG en_US.UTF-8
RUN \
       apt-get install -y locales \
    && locale-gen $LANG \
    && update-locale $LANG \
    && locale

# Timezone switched to Tokyo time (+09:00)
RUN apt-get install tzdata -y \
    && rm /etc/localtime \
    && ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata \
    && date

RUN apt update && \
    apt install -y nano wget curl zip unzip rar unrar cloc htop tmux
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /data/miniconda.sh && \
    chmod +x /data/miniconda.sh
RUN /data/miniconda.sh -b -p /root/miniconda3
ENV PATH /root/miniconda3/bin:$PATH
RUN conda init bash && \
    conda clean -a -y && \
    conda install -y python=3.10 cudnn libcufft cuda-cudart && \
    conda clean -a -y
RUN conda --version

ENV HF_HOME /data/.hf
RUN mkdir -p $HF_HOME

RUN python -V && pip -V
RUN pip install -U hfutils && hfutils whoami
ADD pyskeb.sh           /pyskeb.sh
ADD yolov8.sh           /yolov8.sh
ADD classification.sh   /classification.sh
ADD embeddings_tools.sh /embeddings_tools.sh
ADD cyberharem.sh       /cyberharem.sh
RUN chmod +x /*.sh

RUN ls -al /data

CMD [ "/start.sh" ]
