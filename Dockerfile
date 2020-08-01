FROM frostmourner/alpine-ca:3.5
COPY main /usr/local/bin/golang-test
ENTRYPOINT ["golang-test"]
