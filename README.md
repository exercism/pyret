# Exercism Pyret Track

[![Configlet](https://github.com/exercism/pyret/actions/workflows/configlet.yml/badge.svg)](https://github.com/exercism/pyret/actions/workflows/configlet.yml) [![.github/workflows/test.yml](https://github.com/exercism/pyret/actions/workflows/test.yml/badge.svg)](https://github.com/exercism/pyret/actions/workflows/test.yml)

Exercism exercises in Pyret.

## Setup

If you're solving Exercism exercises offline, you'll need a recent copy of [pyret-npm](https://www.npmjs.com/package/pyret-npm) (0.0.27+).
Currently, pyret-npm works on Linux and MacOS platforms although Windows users can run it via the [WSL](https://learn.microsoft.com/en-us/windows/wsl/).
However, you can also use [Pyret's online IDE](https://code.pyret.org/).
In that case, you'll need to switch from the IDE's default `essentials2021` namespace to the older `essentials2020` supported by pyret-npm.

## Support

For support with Pyret in Exercism, please visit [the Pyret subcategory](https://forum.exercism.org/c/programming/pyret/265) on the official [Exercism forum](https://forum.exercism.org).

## Coding Style

Please consult [the official Pyret style guide](https://pyret.org/docs/latest/Pyret_Style_Guide.html).

## Testing

To test the exercises, run `./bin/verify-exercises` on a Linux or MacOS platform.
This command will iterate over all exercises and check to see if their exemplar/example implementation passes all the tests.

## Contributing Guide

Please see [Exercism's contributing guide](https://exercism.org/docs/building).

At the moment, there's not a generator for Pyret exercises.
Make sure `use context essentials2020` is the first line in all Pyret files to explicitly set the default namespace.

## Track linting

[`configlet`](https://exercism.org/docs/building/configlet) is an Exercism-wide tool for working with tracks. You can download it by running:

```shell
./bin/fetch-configlet
```

Run its [`lint` command](https://exercism.org/docs/building/configlet/lint) to verify if all exercises have all the necessary files and if config files are correct:

```shell
$ ./bin/configlet lint

The lint command is under development.
Please re-run this command regularly to see if your track passes the latest linting rules.

Basic linting finished successfully:
- config.json exists and is valid JSON
- config.json has these valid fields:
    language, slug, active, blurb, version, status, online_editor, key_features, tags
- Every concept has the required .md files
- Every concept has a valid links.json file
- Every concept has a valid .meta/config.json file
- Every concept exercise has the required .md files
- Every concept exercise has a valid .meta/config.json file
- Every practice exercise has the required .md files
- Every practice exercise has a valid .meta/config.json file
- Required track docs are present
- Required shared exercise docs are present
```
