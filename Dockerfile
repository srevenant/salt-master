FROM centos:7

RUN yum -y install https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm
RUN yum -y install salt-master

WORKDIR /srv

COPY pillar /srv/pillar
COPY salt /srv/salt

ENTRYPOINT [ "/usr/bin/salt-master" ]

# always keep current on patches, good DevSecOps
RUN yum -y upgrade && yum -y clean all 
