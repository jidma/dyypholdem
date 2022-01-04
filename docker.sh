#/bin/bash

IMAGE=mlaissi/test-image-conda:v0.2
CONTAINER=test-container-conda

docker container stop $CONTAINER
docker container rm $CONTAINER
docker rmi $IMAGE

set -e

docker build . -t $IMAGE # --no-cache

#docker run --name $CONTAINER -it $IMAGE /bin/bash
#docker run --name $CONTAINER -v /Users/majidlaissi/dev/perso/poker/dyypholdem:/dyypholdem -it $IMAGE /bin/bash
##docker run --rm --gpus all --name $CONTAINER -it $IMAGE /bin/bash
#docker run --rm --gpus all --name test-container-ubuntu -it test-image-ubuntu /bin/bash

# export DA=`date` && python player/dyypholdem_slumbot_player.py 10 && echo $DA && date