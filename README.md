# Tap build artifact buildkite plugin

A private [Buildkite Plugin](https://buildkite.com/docs/agent/v3/plugins) to upload and download build artifacts

## Download Example

```yml
steps:
  - label: ':lint-roller: Validate my schemas!'
    env:
      - YOUR_ENV: 'path/to/*'
    plugins:
      - tapendium/tap-build-artifact#v1.0.0:
          debug: true
          type: download
          repo: organisations
          artifacts-path-env: YOUR_ENV 
```

## Upload Example

```yml
steps:
  - label: ':lint-roller: Validate my schemas!'
    env:
      - YOUR_ENV: 'path/to/*'
    plugins:
      - tapendium/tap-build-artifact#v1.0.0:
          debug: true
          type: upload
          artifacts-path-env: YOUR_ENV 
```

## Developing

To run the tests:

```bash
docker-compose run --rm tests
```
