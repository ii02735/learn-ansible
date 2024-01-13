FROM debian:10

ARG GID
ARG UID

RUN apt-get update && apt-get upgrade -y

RUN groupadd -g $GID ansible && useradd -m -u $UID -g ansible ansible

RUN apt-get install ansible -y
RUN apt-get install openssh-client -y
RUN apt-get install vim -y
USER ansible

RUN ssh-keygen -t rsa -b 4096 -N '' -f /home/ansible/.ssh/id_rsa
