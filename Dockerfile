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
#Automatically starts nginx
COPY --from=builder /app/build /usr/share/nginx/html 


