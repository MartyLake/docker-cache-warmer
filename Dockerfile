FROM alpine:3.17

RUN apk add --no-cache curl bash
COPY . .

CMD bash /entrypoint.bash 

