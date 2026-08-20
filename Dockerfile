FROM node:21

WORKDIR /app

# Copy dependency manifests, similar to using requirements.txt in Python. 
## package*.json files define dependencies for Node.js projects.
COPY package*.json ./

# npm = Node's Package manager, ci = clean install.
## This command installs dependencies based on the package-lock.json file, ensuring a consistent and reproducible build environment. TYPICAL for automated environments like CI/CD pipelines.
RUN npm ci


# Copy the rest of the application code to WORKDIR, /app.
## The application code must be a part of the Docker image, to run the application, to create a container, which can then be deployed.
COPY . .

EXPOSE 80

CMD ["npm", "start"]
