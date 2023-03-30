FROM alpine:latest

RUN apk --no-cache update &&\
    apk add --no-cache npm yarn git python3 py3-pip postgresql-dev gcc python3-dev musl-dev &&\
    git clone https://github.com/Kanaries/Rath.git &&\
    cd Rath &&\
    echo "" >> ./services/connector/requirements.txt &&\
    echo "psycopg2" >> ./services/connector/requirements.txt &&\
    pip install -r ./services/connector/requirements.txt &&\
    yarn install

EXPOSE 3000
EXPOSE 5001

WORKDIR /Rath
ENTRYPOINT ["yarn", "workspace", "rath-client", "start"]