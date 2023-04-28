FROM node:latest as first
RUN apt-get update -y
RUN apt update && apt install -y git npm nodejs
RUN npm install --global yarn
RUN git clone https://github.com/yarnpkg/example-yarn-package.git
RUN yarn init -y
RUN yarn install

FROM first as second
WORKDIR "./example-yarn-package"
RUN yarn install
RUN apt-get update
RUN yarn run test
