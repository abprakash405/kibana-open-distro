#FROM alpine:3.7 as builder

#RUN apk add --no-cache zip

FROM docker.elastic.co/kibana/kibana:7.6.1
MAINTAINER cgiraldo@gradiant.org

RUN bin/kibana-plugin install https://d3g5vo6xdbdb9a.cloudfront.net/downloads/kibana-plugins/opendistro-security/opendistro_security_kibana_plugin-1.6.0.0.zip


COPY kibana.yml /usr/share/kibana/config/kibana.yml

RUN bin/kibana --env.name=production --logging.json=false --optimize
