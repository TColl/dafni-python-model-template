#!/bin/bash

MODEL="{{cookiecutter.image_name}}"

echo "Podman or Docker?"
echo "1 - Podman"
echo "2 - Docker"
read -r ans

if [[ $ans == "1" ]]; then
    container="podman"
elif [[ $ans == "2" ]]; then
    container="docker"
else
    echo "Answer 1, or 2."
    exit 1
fi

echo "What do you want to run?"
echo "1 - build container"
echo "2 - launch container interactively"
echo "3 - simulate run on DAFNI"
echo "4 - build and then run locally"
echo "5 - run jupyter lab inside the model container"
read -r ans

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [[ $ans == "1" ]]; then
    $container build -t ${MODEL} .
elif [[ $ans == "2" ]]; then
    $container run --rm --env-file .env -v $SCRIPT_DIR/data:/data -it ${MODEL} bash
elif [[ $ans == "3" ]]; then
    $container run --rm --env-file .env -v $SCRIPT_DIR/data:/data ${MODEL}
elif [[ $ans == "4" ]]; then
    $container build -t ${MODEL} . \
    && $container run --rm --env-file .env -v $SCRIPT_DIR/data:/data ${MODEL}
elif [[ $ans == "5" ]]; then
    $container run --rm -p "127.0.0.1:8888:8888" --env-file .env -v $SCRIPT_DIR/data:/data -it ${MODEL} bash -c "cd /data && pip install jupyterlab && jupyter lab --allow-root --ip=0.0.0.0"
else
    echo "Answer 1-5."
    exit 1
fi
