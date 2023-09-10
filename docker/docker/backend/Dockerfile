# specify the node base image with your desired version node:<version>
FROM node:18-alpine

RUN addgroup -S appgroup && adduser -S -G appgroup appuser

ENV BACKJS=/home/appuser/backend/

ENV MONGO_URI mongodb://login:passsword@ip_address:27017/baza?authSource=admin&readPreference=primary&ssl=false
ENV PORT 
ENV ADMIN_EMAIL 
ENV START_LOGIN 
ENV START_PASSWORD 
ENV SECRET_KEY 
ENV ACCESS_TOKEN_TIME 
ENV SMTP_GMAIL_USER 
ENV SMTP_GMAIL_PASSWORD 
ENV JWT_ACCESS_SECRET 
ENV JWT_REFRESH_SECRET 
ENV APP_URL 
ENV API_URL 
ENV CLIENT_URL 

WORKDIR ${BACKJS}

COPY ./450-kherson-humanitarian-landing-page-backend/package*.json ./

RUN chown -R appuser:appgroup ./

USER appuser

RUN npm install --only=production --no-fund

COPY 450-kherson-humanitarian-landing-page-backend ./

EXPOSE 3001:3001

#RUN npm run build

CMD ["npm", "run", "start"]
