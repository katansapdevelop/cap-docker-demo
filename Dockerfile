# Base image - using debian-based image instead of alpine for better native module support
FROM node:24.13.0

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci

# Copy all project files
COPY . .

# Set environment variable for development (uses SQLite)
ENV NODE_ENV=development

# Expose the port your app runs on (adjust if necessary)
EXPOSE 4004

# Start the application
CMD ["node", "node_modules/@sap/cds/bin/serve.js", "--with-mocks", "--in-memory"]