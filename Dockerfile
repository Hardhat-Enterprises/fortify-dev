# get the base node image
FROM node:alpine as builder

# set the working dir for container
WORKDIR /frontend

# copy the json file first
COPY --chown=node:node ./package.json /frontend

# install npm dependencies
RUN npm install
RUN mkdir -p /frontend/node_modules/.cache && chmod -R 777 /frontend/node_modules/.cache

# copy other project files
COPY --chown=node:node . .

# build the folder
CMD [ "npm", "run", "start" ]
