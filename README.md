# Test case for entwine latest

## Prerequisites

- node js
- yarn
- docker

## Run

Launch

```
yarn install
./start.sh
```

Navigate using chrome to http://localhost:8081/ to see links to 4 examples.

## Result with entwine 1.3

- Use chrome to navigate to http://localhost:8081/with13/index.html
- Cesium loads and a colored point cloud is visible in Autzen.
- Note however that some tiles do not display correctly because of an unrelated annoying bug in Cesium or Entwine. This bug create the following warnings in Chrome console:

```
Error: start offset of Uint16Array should be a multiple of 2
Cesium.js:518 A 3D tile failed to load: http://localhost:8081/with13/tiles/cesium/4281685-1.pnts
```

## Result with entwine latest

- Use chrome to navigate to http://localhost:8081/with13/index.html
- Cesium crashes with the following error because no color data is exported by Entwine in 3D tiles:

```
RuntimeError: Style references a property "Red" that does not exist or is not styleable.
```
