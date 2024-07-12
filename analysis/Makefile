
SHELL := /bin/bash



#
# build the singularity image
#

build_base:
	sudo docker build --progress=plain -t ${DOCKER_NAMESPACE}/root_base:v6.31.01 --compress .
build_sif:	
	sudo singularity build root_base_v6.31.01.sif docker-daemon://${DOCKER_NAMESPACE}/root_base:v6.31.01
push:
	sudo docker push ${DOCKER_NAMESPACE}/root_base:v6.31.01
pull:
	sudo singularity pull docker://${DOCKER_NAMESPACE}/root_base:v6.31.01
clean:
	docker system prune


run_local:
	singularity run --bind /mnt:/mnt ${DOCKER_IMAGES}/root_base_v6.31.01.sif

run:
	source envs.sh
	singularity run --bind /mnt:/mnt --writable-tmpfs ${DOCKER_IMAGES}/root-cern_latest.sif bash ./activate.sh

#
# vitual environ
#
build_local:
	virtualenv -p python ${VIRTUALENV_NAMESPACE}
	source ${VIRTUALENV_NAMESPACE}/bin/activate && pip install -r requirements.txt


