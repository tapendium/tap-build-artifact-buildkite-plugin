# Tap build artifact buildkite plugin

A private [Buildkite Plugin](https://buildkite.com/docs/agent/v3/plugins) to upload and download build artifacts

## Download Example

```yml
steps:
  - label: 'Download artifacts'
    env:
      - YOUR_ENV: 'path/to/*'
    plugins:
      - tapendium/tap-build-artifact#v1.1.0:
          debug: true
          type: download
          artifacts-path-env: YOUR_ENV
```

**Specifying artifact path directly**

```yml
steps:
  - label: 'Download artifacts'
    plugins:
      - tapendium/tap-build-artifact#v1.1.0:
          debug: true
          type: download
          artifacts-path: path/to/*
```

## Upload Example

```yml
steps:
  - label: 'Upload artifacts'
    env:
      - YOUR_ENV: 'path/to/*'
    plugins:
      - tapendium/tap-build-artifact#v1.1.0:
          debug: true
          type: upload
          artifacts-path-env: YOUR_ENV
```

**Specifying artifact path directly**

```yml
steps:
  - label: 'Upload artifacts'
    plugins:
      - tapendium/tap-build-artifact#v1.1.0:
          debug: true
          type: upload
          artifacts-path: path/to/*
```

## Developing

To run the tests:

```bash
docker-compose run --rm tests
```
