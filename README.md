# Dockerfile of bfmc_simulator:1.0
This repository saves Dockerfile of docker image bfmc_simulator:1.0 [here](https://hub.docker.com/repository/docker/yeongyoo/bfmc_simulator/general). It is Docker image for BFMC(Bosch Future Mobilitry Challenge) competitors, and this image would make you enable to use the simulator code of BFMC, with just pulling and using this docker image. Because ROS only works on Ubuntu version 20.04, if you are using the other version of Ubuntu or other things which is inavailable with ROS, you can pull this Docker container and use it.

I referred to this [link](https://bosch-future-mobility-challenge-documentation.readthedocs-hosted.com/data/simulator.html) for the required bash commands for Docker container, and the cloned github repository is [here](https://github.com/ECC-BFMC/Simulator/tree/main).

## How can I use?

### step1:pulling
First of all, you have to pull this image to your PC:
```
docker pull yeongyoo/bfmc_simulator:1.0
```

### step2:running
and you can make it into Docker container by running:
```
docker run --name bfmc -it --network host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix yeongyoo/bfmc_simulator:1.0
```
OR if you want volume mounting, you can run like:
```
docker run --name bfmc -it --network host -v {path to my workplace}:/root/Simulator -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix yeongyoo/bfmc_simulator:1.0
```

### step3:executing

I highly recommend simplifying it all the processes by running this command:
```
echo "alias roson='sudo docker start bfmc && xhost +local:docker && docker exec -it bfmc /bin/bash'" >> ~/.bashrc
echo "alias rosgo='docker exec -it bfmc /bin/bash'" >> ~/.bashrc
```
Maybe you would use Terminator or lots of terminal to run ROS. Whenever you execute this docker container on the first terminal, you can just enter ```roson```, and from the second terminal, you can enter ```rosgo```. like this:

First terminal:
```roson```

Second terminal:
```rosgo```

Third terminal:
```rosgo```

WOW IT IS FXCKING EASY!!!!
