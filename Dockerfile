ARG ARCH=
FROM debian:latest

RUN apt update && apt upgrade -y

RUN apt install -y psutils less procps

COPY ./ventoy/ /ventoy

EXPOSE 24680/tcp

WORKDIR /ventoy

CMD [ "./VentoyWeb.sh", "-H", "0.0.0.0" ]
