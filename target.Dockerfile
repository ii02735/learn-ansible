FROM debian:10

ARG GID
ARG UID

RUN apt-get update && apt-get upgrade -y

RUN groupadd -g $GID target && useradd -m -u $UID -g target target
RUN echo "target:password" | chpasswd
RUN apt-get install openssh-client openssh-server -y
# python is mandatory for ansible to execute programs in the target host
RUN apt-get install python3 -y
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN mkdir /run/sshd
CMD ["/usr/sbin/sshd", "-D"]
