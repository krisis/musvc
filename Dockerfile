FROM alpine:edge
COPY ./bin/musvc /usr/bin/musvc
CMD /usr/bin/musvc
