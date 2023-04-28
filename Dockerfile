FROM node:latest as first
RUN apt-get update && apt-get -y upgrade
RUN git clone https://github.com/yarnpkg/example-yarn-package.git
RUN yarn

FROM first as second
WORKDIR "./example-yarn-package"
RUN yarn
RUN yarn run test
