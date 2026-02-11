# Base stage - common setup for both dev and production
FROM node:24.13.0 AS base

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package.json package-lock.json ./

# ============================================
# Development stage
# ============================================
FROM base AS development

# Install all dependencies (including devDependencies)
RUN npm ci

# Copy all project files
COPY . .

# Set environment variable for development
ENV NODE_ENV=development

# Expose the port your app runs on
EXPOSE 4004

# Start with hot-reload and mocks
CMD ["node", "node_modules/@sap/cds/bin/serve.js", "--with-mocks", "--in-memory"]

# ============================================
# Production stage
# ============================================
FROM base AS production

# Install only production dependencies
RUN npm ci --omit=dev

# Copy all project files
COPY . .

# Set environment variable for production
ENV NODE_ENV=production

# Expose the port your app runs on
EXPOSE 4004

# Start the application
CMD ["node", "node_modules/@sap/cds/bin/serve.js", "--in-memory"]