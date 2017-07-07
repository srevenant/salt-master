# salt master

This is an example of how to leverage containers even for things such as a salt master.

This is intended as a reference, run as a swarm service, on a single node with local storage (or shared if you want to put it into a cluster).

Stackfile is: salt-master.yml

The stateful volumes that are referenced:

    mkdir -p /data/salt-master/pki
    mkdir -p /data/salt-master/log
    mkdir -p /data/salt-master/cache
    mkdir -p /data/salt-master/master.d

Create the service with:

    docker swarm init
    docker stack deploy -c salt-master.yml salt

Update the service with:

    docker build -t salt-master . && \
        docker service update salt_master --image=salt-master --force

(one might suggest you have a CI system trigger this command on a merge to a git repo)

Files located in bin/ are meant to be run from the outside host, to reach inside the container.
