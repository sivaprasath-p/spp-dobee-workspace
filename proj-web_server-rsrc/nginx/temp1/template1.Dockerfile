FROM nginx 

RUN apt-get update

RUN apt-get install wget unzip -y

COPY ./template1.Provision.sh /opt/

WORKDIR /opt/

RUN ./template1.Provision.sh

CMD ["nginx", "-g", "daemon off;"]
