FROM node:20-alpine

WORKDIR /app

# Copy dependency files from nextjs folder
COPY nextjs/package.json nextjs/package-lock.json ./

# Install dependencies
RUN npm ci

# Copy full app
COPY nextjs/ ./

RUN npm run build

EXPOSE 3000

CMD ["npm", "run", "start"]
