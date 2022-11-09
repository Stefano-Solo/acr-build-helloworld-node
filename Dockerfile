FROM ubuntu:latest

#COPY . /src
#RUN cd /src && npm install
#EXPOSE 80
#CMD ["node", "/src/server.js"]

# Download
# Create a folder
RUN mkdir actions-runner && cd actions-runner
# Download the latest runner package
CMD curl -o actions-runner-linux-x64-2.299.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.299.1/actions-runner-linux-x64-2.299.1.tar.gz
# Optional: Validate the hash
CMD echo "147c14700c6cb997421b9a239c012197f11ea9854cd901ee88ead6fe73a72c74  actions-runner-linux-x64-2.299.1.tar.gz" | shasum -a 256 -c
# Extract the installer
CMD tar xzf ./actions-runner-linux-x64-2.299.1.tar.gz

#Configure
# Create the runner and start the configuration experience
RUN ./config.sh --url https://github.com/mariocastronovo/acr-build-helloworld-node --token ABZU3MTMYH2XI7PHVQMUASTDNN5OS
# Last step, run it!
RUN ./run.sh

# Using your self-hosted runner
# Use this YAML in your workflow file for each job
RUN runs-on: self-hosted
