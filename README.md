# Tap build artifact buildkite plugin

A private [Buildkite Plugin](https://buildkite.com/docs/agent/v3/plugins) to upload and download build artifacts

## Example

```yml
steps:
  - label: ':lint-roller: Validate my schemas!'
    env:
      - YOUR_ENV: 'path/to/*'
    plugins:
      - tapendium/tap-build-artifact#v1.0.0:
          debug: true
          type: download
          artifacts-path-env: YOUR_ENV 
```

## Developing

To run the tests:

```bash
docker-compose run --rm tests
```

## License

[MIT](https://opensource.org/licenses/MIT)
