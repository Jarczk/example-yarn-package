ARG GIT_REPO=https://github.com/Jarczk/example-yarn-package.git
FROM node:latest as build
RUN apt-get update && apt-get -y upgrade
RUN git clone ${GIT_REPO}
RUN yarn

FROM build as test
WORKDIR "./example-yarn-package"
RUN yarn
RUN yarn run test
