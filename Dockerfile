#FROM pytorch/pytorch:1.10.0-cuda11.3-cudnn8-runtime
FROM conda/miniconda3

WORKDIR /setup
RUN . /root/.bashrc && conda update conda -y
RUN . /root/.bashrc && conda create -n py38 python=3.8 anaconda
RUN . /root/.bashrc && conda init
RUN . /root/.bashrc && conda activate py38 && conda install pytorch -c pytorch
RUN . /root/.bashrc && conda activate py38 && conda install -c conda-forge loguru sqlite

RUN apt-get update
RUN apt-get install software-properties-common git -y
RUN apt-get install curl -y
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
RUN apt-get install git-lfs -y
RUN git lfs install

# WORKDIR
WORKDIR /app

#CMD ["python", "player/dyypholdem_slumbot_player.py", "1"]
CMD ["/bin/bash"]

#conda activate py38 && python player/dyypholdem_slumbot_player.py 1