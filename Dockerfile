FROM registry.access.redhat.com/ubi8/ubi:latest

RUN yum update -y
RUN yum install -y unzip
# RUN yum groupinstall -y "Development Tools"
RUN yum install vim-enhanced -y
RUN yum install -y gcc-c++ make
# install python/pipenv

ENV PYTHON_VERSION=3.9
RUN yum install -y python${PYTHON_VERSION}
RUN pip3 install --upgrade pip
RUN python3 -V
RUN pip --version
RUN /bin/pip-${PYTHON_VERSION} install pipenv
RUN pip install boto3
RUN pip show boto3
RUN yum install -y jq

# Download terraform for linux
ENV TERRAFORM_VERSION=1.1.0
RUN curl -sSLo /tmp/terrraform.zip https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip -d /bin /tmp/terrraform.zip && \
    rm -rf /tmp/terrraform.zip
 



