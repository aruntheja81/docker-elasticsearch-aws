# docker-elasticsearch-aws
Ready to use Elasticsearch + AWS plug-in Docker image.

[![Docker Repository on Quay.io](https://quay.io/repository/pires/docker-elasticsearch-aws/status "Docker Repository on Quay.io")](https://quay.io/repository/pires/docker-elasticsearch-aws)

## Current software

* Oracle JRE 8 Update 45
* Elasticsearch 1.6.0
* AWS plug-in 2.6.0

## Pre-requisites

* Docker 1.5.0+

## Run

You need a folder named `config` with your own version of `elasticsearch.yml`. You can add other Elasticserach configuration files to this folder, such as `logging.yml`.

```
docker run --rm -v /path/to/config:/elasticsearch/config quay.io/pires/docker-elasticsearch-aws:1.6.0
```

In case you want to specify a data folder so that Elasticsearch writes to storage outside the container, run
```
docker run --rm -v /path/to/config:/elasticsearch/config -v /path/to/data_folder:/data quay.io/pires/docker-elasticsearch-aws:1.6.0
```
