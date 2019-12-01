[![CircleCI](https://circleci.com/gh/bazelruby/ruby-monorepo/tree/kig%2Fcircleci.svg?style=svg)](https://circleci.com/gh/bazelruby/ruby-monorepo/tree/kig%2Fcircleci)

# Mini Mono-Repo with Sample Ruby Projects built by Bazel

This is a work in progress, which attempts to bridge the world of Ruby gems and applications with the Bazel Build System.

## Usage

Install Bazel using `brew install bazel`.

Then:

```bash
bazel build //...:all
bazel query //...:all
bazel run   //ruby/gems/hello_world:cli
```

## Directory Structure

Below you will find the following folders — note, that the exact directory structure for monorepos is still work in progress.:

![file-tree](doc/file-tree.png)

## Feedback and Contribitions

To be continued.
