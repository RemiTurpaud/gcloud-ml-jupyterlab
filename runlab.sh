#!/usr/bin/env bash
if [[ $BUCKET ]]
then
  gcsfuse fx-env /mnt/gs
  ln -s /mnt/gs/$SYNCDIR /home/jupyterlab/
fi

export JUPYTER_TOKEN=$TOKEN
jupyter lab --ip 0.0.0.0 --port 8888 --notebook-dir /home/jupyterlab --allow-root
