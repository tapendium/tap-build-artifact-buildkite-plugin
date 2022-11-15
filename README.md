# Tap build artifact buildkite plugin

A private [Buildkite Plugin](https://buildkite.com/docs/agent/v3/plugins) to upload and download build artifacts for 

## Example

```yml
steps:
  - label: ':lint-roller: Validate my schemas!'
    plugins:
      - tapendium/tap-build-artifact-buildkite-plugin#v1.0.0:
          debug: true
          repo: organisations
          artifact-path-env: YOUR_ENV 
```

## Developing

To run the tests:

```bash
docker-compose run --rm tests
```

## License

[MIT](https://opensource.org/licenses/MIT)
