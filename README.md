# Sample Mono-Repo with Ruby Projects that use Bazel Ruby Rules

This is a work in progress, which attempts to bridge the world of Ruby gems and applications with the Bazel Build System.

# WARNING: This repo is currently under development and is unstable.

## Contents

Below you will find two folders:

 * [`tools/ruby`](tools/ruby/README.md) — Bazel Rules we are using - please click to read about our Ruby Rules goals. This folder is the derivative of [this open source project](https://github.com/zaccari/rules_ruby).

 * [`ruby/gems/cb-helloworld`](ruby/gems/cb-helloworld/README.md) — Ruby Gem `cb-helloworld` that prints "Hello World" in 74 languages.

 * [`ruby/apps/cb-helloworld-web`](ruby/apps/cb-helloworld-web/README.md) — A tiny Sinatra App that uses the above Ruby Gem to offer a simple web interface to the Hello World in many languages.

## Usage

Install Bazel using `brew install bazel`.

Then:

```bash
bazel build //...:all
```

## Feedback and Contribitions

To be continued.
