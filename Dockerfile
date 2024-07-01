# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the application code to the container
COPY . .

# Change directory to packages/editor-sample and install dependencies
WORKDIR /app/packages/editor-sample
RUN npm install

# Modify vite.config.ts to change base from '/email-builder-js/' to '/'
RUN sed -i "s|base: '/email-builder-js/',|base: '/',|" vite.config.ts

# Expose the port the app runs on
EXPOSE 5173

# Run the application
CMD ["npx", "vite", "--port", "80", "--host", "0.0.0.0"]