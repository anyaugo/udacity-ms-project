# udacity-ms-project
Microservice-Kubernetes project

# status badge
[![CircleCI](https://circleci.com/gh/anyaugo/udacity-ms-project/tree/main.svg?style=svg)]
(https://circleci.com/gh/anyaugo/udacity-ms-project/tree/main)

# project summary overview
This project involves the operationalization of a Machine Learning Microservice API using a Kubernetes-Docker Environment.

The Microservice API is a Python flask app that runs a pre-trained 'sklearn' model that predicts housing prices in the Boston region based on several features.

# source files overview
## .circlceci/config.yml
Config file to run circleci continous integration process. Checks out files from repo; restores cache; install depencies like hadolint; saves cache; then lints dockerfile.

## model_data
Contains the data for the machine learning model through a housing.csv file and a boston_housing_prediction.joblib binary file

## output_txt_files
Contains the console outpust in .txt files from running the app sklearn model in a stand-alone docker conatiner (see docker_out.txt file) and in a kubernetes environment (see kubernetes_out.txt file).

## app.py
Contains the script for the python flask app.

## Dockerfile
Contains the steps to build the docker container for the python flask app. Involves creating a working dir; copying the app.py file into working dir location; installing the necessary python packages based on requirements.txt file; exposing the docker container port the application will be hosted on (port 80); running in the pyhton application file.

## make_prediction.sh
Shell script to make predictions by posting data to the running app container URL.

## Makefile
Makefile that contains commands for installing required python packages in the virtual environment based on the requirements.txt file; and lints the dockerfile using hadolint and the pyhton application file using pylint.

## requirements.txt
.txt file that contains all the required python packages to be installed in the environment and their relevant versions.

## run_docker.sh
Shell script that runs docker commands which builds the docker image from the docker file; checks if the image has been built; and then runs the contianer image with the exposed container port forwarded to a port on the localhost.

## run_docker.sh
Shell script that runs kubernetes commands which deploys the docker ontainer pod; checks if the pod is running in the kubernetes environment; then port forwards the exposed container port to a port on the localhost.

## run_docker.sh
Shell script that pushes the built docker container image to a docker hub repo.

# running scripts
## running makefile
cd into Makefile directory

### setup python virtual environment
RUN: make setup

### install python packages and dependencies based on requiremnets file
RUN: make install

### lint dockerfile and python app file using hadolint and pylint
RUN: make lint

## running python flask application
### stand-alone
cd into app.py directory
RUN: python app.py

### using stand-alone docker conatiner
cd into run_docker.sh directory
RUN: ./run_docker.sh

### using kubernetes environment
cd into run_kubernetes.sh directory
RUN: ./run_kubernetes.sh

## uploading docker image to docker hub
cd into upload_docker.sh directory
RUN: ./run_kubernetes.sh

## making machine learing application prediction
cd into make_prediction.sh directory
RUN: ./make_prediction.sh


