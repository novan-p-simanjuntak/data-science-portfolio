FROM ubuntu
MAINTAINER impulse.impulse0@gmail.com

# update ubuntu
RUN apt-get update && apt-get -y upgrade
# update python library, pip whell, bsdist
RUN apt-get install -y python
RUN apt-get install -y python-pip

# install git
RUN apt-get install -y git

# clone git
RUN git clone https://github.com/novan-p-simanjuntak/data-science-portfolio.git

# Change dir to project dogsvscats
WORKDIR data-science-portfolio/dogsvscats/

# Install virtual-env and activate it
RUN pip install --upgrade pip                      # upgrade pip
RUN pip install --upgrade virtualenv               # install virtualenv
RUN virtualenv .env                                # create environment in .env
RUN source .env/bin/activate                       # activate virtual environment

# install virtual env
RUN pip install -r requirements.txt

