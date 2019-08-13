FROM python:3-alpine

# for dev/compiling modules, if needed
#    apk add python3-dev libffi ca-certificates \
#        inotify-tools git openssh bash vim \
#        nodejs libffi-dev gcc libc-dev tar make && \
RUN apk update && \
    apk add salt-master

WORKDIR /srv

COPY pillar /srv/pillar
COPY salt /srv/salt

CMD [ "/usr/bin/salt-master" ]
