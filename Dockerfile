# Use the official Node.js LTS base image
FROM node:20-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy only package files to install dependencies first (for caching)
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Define the command to run the app
CMD ["node", "index.js"]
