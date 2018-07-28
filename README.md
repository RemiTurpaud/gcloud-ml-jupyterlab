# gcloud-ml-jupyterlab
A jupyter lab docker with Google Cloud integration.

Get last build on remibhai/jupyterlab.

## Content:
- Jupyter Lab
- Scipy, tensorflow, keras, sklearn, seaborn, bokeh
- Gogogle cloud: gcsfuse google-cloud-sdk
- Jupyter Lab Google Drive plugin (see https://github.com/jupyterlab/jupyterlab-google-drive)

## Execution options:
Set the following environment variables for
- BUCKET = Google Cloud storage bucket name, will mounted to /mnt/bucket and available under the gs sub-folder of the notebook directory (if SYNCDIR unsecified). 
- SYNCDIR = only synchronizes a sub-directory of the bucket
- TOKEN = the jupyter lab authentication token.

## Access
Jupyter lab is mapped to port 8888, use the token specified above to log in the first time.
