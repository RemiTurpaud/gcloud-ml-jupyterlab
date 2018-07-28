FROM continuumio/miniconda3:latest

RUN apt-get update && apt-get install -y wget gnupg gcc

COPY requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip
RUN pip --no-cache-dir install -r /tmp/requirements.txt

#install jupyter lab
RUN conda config --add channels conda-forge
#RUN conda install -c cpcloud nodejs jupyterlab
RUN conda install -c conda-forge nodejs jupyterlab

#Install jupyter drive
RUN jupyter labextension install @jupyterlab/google-drive

# Add google cloud repos
#No debian 9 release yet, use jessie
RUN echo "deb http://packages.cloud.google.com/apt gcsfuse-jessie main" | tee /etc/apt/sources.list.d/gcsfuse.list; \
  echo "deb http://packages.cloud.google.com/apt cloud-sdk-jessie main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list; \
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
  apt-get update ; apt-get install -y apt-utils kmod && apt-get install -y gcsfuse google-cloud-sdk

#RUN apt-get update && apt-get install -y gcsfuse google-cloud-sdk

#Mount bucket
RUN mkdir /mnt/gs

RUN mkdir /home/jupyterlab
ENV PATH /opt/conda/bin:$PATH
WORKDIR /home/jupyterlab

ENV BUCKET ''
ENV TOKEN ''
ENV SYNCDIR ''

COPY runlab.sh /home/jupyterlab/runlab.sh
RUN chmod 555 /home/jupyterlab/runlab.sh
CMD /home/jupyterlab/runlab.sh

EXPOSE 8888
