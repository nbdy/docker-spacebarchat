FROM python:3.11-bookworm

RUN apt-get update \
  ; apt-get upgrade -y \
  ; apt-get install -y build-essential git

RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
RUN apt-get install -y nodejs

RUN useradd -m spacebar
USER spacebar
RUN git clone https://github.com/spacebarchat/server.git /home/spacebar/server
WORKDIR /home/spacebar/server

RUN npm install
RUN npm run setup

ENTRYPOINT ["npm", "run", "start"]
