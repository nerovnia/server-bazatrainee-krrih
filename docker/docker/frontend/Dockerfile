# specify the node base image with your desired version node:<version>
FROM node:18-alpine

RUN addgroup -S appgroup && adduser -S -G appgroup appuser

ENV NEXTJS=/home/appuser/frontend/

WORKDIR ${NEXTJS}

COPY 450-kherson-humanitarian-landing-page/package*.json ./

RUN chown -R appuser:appgroup ./

USER appuser

RUN npm install --only=production --no-fund

COPY 450-kherson-humanitarian-landing-page ./

EXPOSE 3000

USER root
RUN npm run build
USER appuser

CMD ["npm", "run", "start"]

