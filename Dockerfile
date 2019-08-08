FROM node:10.0.0

USER node

# global node installations
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

# Install global packages
RUN npm install contentful-cli -g

WORKDIR home/node