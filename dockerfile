FROM node:latest

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install
FROM jenkins/jenkins:lts

# Install kubectl
USER root
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.25.0/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

COPY . .

EXPOSE 4000
CMD [ "node", "index.js" ]
