#Build phase
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
#Creates build folder in /app/build
RUN npm run build

#Run phase (takes output from builder)
FROM nginx
#Tells AWS which port to map to
EXPOSE 80

#Automatically starts nginx
COPY --from=builder /app/build /usr/share/nginx/html 


