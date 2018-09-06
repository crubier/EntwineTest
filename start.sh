#!/usr/bin/env bash

# Build tiles with entwine 1.3
rm -rf ./with13/tiles
mkdir ./with13/tiles
docker run \
    -ti \
    -v $PWD/las:/las \
    -v $PWD/with13:/with13 \
    connormanning/entwine:1.3 \
    build \
    /with13/config.json \
    -i /las/autzen.laz \
    -o /with13/tiles

# Build tiles with entwine latest
rm -rf ./withlatest/intermediate
mkdir ./withlatest/intermediate
docker run \
  -ti \
  -v $PWD/las:/las \
  -v $PWD/withlatest:/withlatest \
  connormanning/entwine:latest \
  build \
  --threads 4 \
  --reprojection EPSG:4978 \
  --config /withlatest/config.json \
  --input /las/autzen.laz \
  --output /withlatest/intermediate

rm -rf ./withlatest/tiles
mkdir ./withlatest/tiles
docker run \
  -ti \
  -v $PWD/withlatest:/withlatest \
  connormanning/entwine:latest \
  convert \
  --truncate \
  --geometricErrorDivisor 16 \
  --threads 4 \
  --input /withlatest/intermediate \
  --output /withlatest/tiles

# Serve
http-server .
