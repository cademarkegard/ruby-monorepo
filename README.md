[![CircleCI](https://circleci.com/gh/bazelruby/ruby-monorepo.svg?style=svg)](https://circleci.com/gh/bazelruby/ruby-monorepo)

- [Mini Mono-Repo with Sample Ruby Projects built by Bazel](#mini-mono-repo-with-sample-ruby-projects-built-by-bazel)
  - [Pre-requisites](#pre-requisites)
  - [Usage](#usage)
    - [HelloWorld Gem](#helloworld-gem)
    - [Building and Running Targets via Bazel](#building-and-running-targets-via-bazel)
      - [Finding Available Targets](#finding-available-targets)
      - [Running CLI via Bazel](#running-cli-via-bazel)
      - [Running RSpecs via Bazel](#running-rspecs-via-bazel)
  - [Directory Structure](#directory-structure)
  - [Feedback and Contributions](#feedback-and-contributions)

# Mini Mono-Repo with Sample Ruby Projects built by Bazel

This is a work in progress, which attempts to bridge the world of Ruby gems and applications with the Bazel Build System.

## Pre-requisites

Install [Bazel](https://docs.bazel.build/versions/master/install-os-x.html#install-with-installer-mac-os-x) using a binary installer if you prefer, or using Homebrew: `brew install bazel`.

Then run provided setup script:

```bash
bin/setup
```

## Usage


### HelloWorld Gem

The repo currently contains a working Gem called `hello_world` which provides a CLI that outputs Hello World! in 74 languages. 

If you were to use this gem without Bazel, you'd likely do something like this:

```bash
cd ruby/gems/hello_world
bundle check || bundle install
bundle exec exe/hello-world turkish
# Turkish — Selam Dünya!
bundle exec exe/hello-world russian
# Russian — Привет мир!
bundle exec exe/hello-world japanese
# Japanese — こんにちは世界！
```

### Building and Running Targets via Bazel

This mono-repo depends on the [rules_ruby](https://github.com/bazelruby/rules_ruby) repository (`develop` branch).

From the top directory of the project, where the `WORKSPACE` file is found, run, eg:

#### Finding Available Targets

```bash
bazel query //...:all
# //ruby/gems/hello_world:specs
# //ruby/gems/hello_world:cli
# //ruby/gems/hello_world:hello-world-lib
# Loading: 1 packages loaded
```

You can build all targets with:

```bash
bazel build //...:all  # shows targets available
#....  lots of output is skipped
```
#### Running CLI via Bazel

Finally, you could run the same CLI using Bazel:

```bash
bazel run //ruby/gems/hello_world:cli russian
# INFO: Analyzed target //ruby/gems/hello_world:cli (0 packages loaded, 0 targets configured).
# INFO: Found 1 target...
# Target //ruby/gems/hello_world:cli up-to-date:
#   bazel-bin/ruby/gems/hello_world/cli
# INFO: Elapsed time: 0.175s, Critical Path: 0.00s
# INFO: 0 processes.
# INFO: Build completed successfully, 1 total action
# INFO: Build completed successfully, 1 total action
Russian — Привет мир!
```

#### Running RSpecs via Bazel

As one of the targets is `hello_world:specs` you can run it like so:

```bash
bazel test //ruby/gems/hello_world:specs
#  - /Users/kig/Coinbase/bazel/github/bazelruby/ruby-monorepo/WORKSPACE:11:1
# INFO: Analyzed target //ruby/gems/hello_world:specs (0 packages loaded, 14 targets configured).
# INFO: Found 1 test target...
# Target //ruby/gems/hello_world:specs up-to-date:
#   bazel-bin/ruby/gems/hello_world/specs
# INFO: Elapsed time: 0.747s, Critical Path: 0.60s
# INFO: 2 processes: 2 darwin-sandbox.
# INFO: Build completed successfully, 2 total actions
# //ruby/gems/hello_world:specs                                            PASSED in 0.4s
# 
# Executed 1 out of 1 test: 1 test passes.
# There were tests whose specified size is too big. Use the --test_verbose_timeout_warnings command line
# INFO: Build completed successfully, 2 total actions
```

## Directory Structure

Below you will find the following folders — note, that the exact directory structure for monorepos is still work in progress.:

![file-tree](doc/file-tree.png)

## Feedback and Contributions

To be continued.