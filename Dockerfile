FROM node:latest as build
RUN apt-get update && apt-get -y upgrade
RUN git clone https://github.com/yarnpkg/example-yarn-package.git
RUN yarn

FROM build as test
WORKDIR "./example-yarn-package"
RUN yarn
RUN yarn run test
