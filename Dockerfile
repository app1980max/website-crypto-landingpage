FROM node:20-alpine

WORKDIR /app

COPY nextjs/package.json ./

# If lock file exists, use ci; otherwise fallback
RUN if [ -f package-lock.json ]; then npm ci; else npm install; fi

COPY nextjs/ ./

RUN npm run build

EXPOSE 3000

CMD ["npm", "run", "start"]
