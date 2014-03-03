# Kibana

Uses latest Kibana (at moment of build)

Uses nginx to front the new Kibana

* `docker build -t kibana .`
* `docker run -e ES_HOST=1.2.3.4 -e ES_PORT=9200 kibana`

Ports

* 80 (kibana)
