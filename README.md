[![CircleCI](https://circleci.com/gh/bazelruby/ruby-monorepo.svg?style=svg)](https://circleci.com/gh/bazelruby/ruby-monorepo)

* [Setting stuff up for the impatient](#setting-stuff-up-for-the-impatient)
  * [The Setup Script](#the-setup-script)
* [Repo Components](#repo-components)
    * [Ruby Gem hello_world](#ruby-gem-hello_world)
    * [Ruby Sinatra Web App that uses hello_world gem](#ruby-sinatra-web-app-that-uses-hello_world-gem)
* [Using Bazel to Build, Test and Run Ruby](#using-bazel-to-build-test-and-run-ruby)
    * [Bazel Workspace](#bazel-workspace)
  * [Getting Around with Bazel](#getting-around-with-bazel)
    * [1. Finding Available Targets](#1-finding-available-targets)
    * [2. Running CLI via Bazel](#2-running-cli-via-bazel)
    * [3. Running Gem Specs via Bazel](#3-running-gem-specs-via-bazel)
    * [4. Running Sinatra Web Server via Bazel](#4-running-sinatra-web-server-via-bazel)
  * [Feedback and Contributions](#feedback-and-contributions)
* [Copyright](#copyright)

#### Mission Statement

**The goal of this BazelRuby integration project is to make Ruby a first-class citizen in the Bazel eco-system, to be able to support very large Ruby mono-repo, and to take advantage of the parallel builds and fast caching that Bazel is famous for.**

# An Example of a Ruby Mono-Repo for Training Purposes

Please note –— most of the development is currently happening in the <https://github.com/bazelruby/rules_ruby> repository. Please join if you'd like to collaborate.

**The following screen-cast shows the basic usage of the bazel commands.**

<a href="https://asciinema.org/a/tp7zrxecdiZuj3rPMEZw48jsT" target="_blank"><img src="https://asciinema.org/a/tp7zrxecdiZuj3rPMEZw48jsT.svg" width="500"/></a>

> NOTE: This is still work in progress, which attempts to bridge the world of Ruby gems and applications with the Bazel Build System. NOTE: This project has been developed and tested on Mac OS-X. If you are on Windows, your mileage may vary.

## Setting stuff up for the impatient

 * Run `xcode-select --install` if it's a new laptop
 * Install [Homebrew](https://brew.sh) according to instructions there
 * Run `bin/setup` script inside the repo.
 * Run `bazel build ...` and watch its magic happen.

### The Setup Script

Then run the provided setup script `bin/setup`:

You should see an output that's similar to [this image.](doc/ruby-mono-setup.jpg).

## Repo Components

This section briefly explains the components of this repository. Below is the directory tree up to 4 level deep:


```bash
.
├── bin
├── doc
└── ruby
    ├── apps
    │   └── hello-world-web    # siantra app
    │       ├── app
    │       ├── bin
    │       ├── doc
    │       ├── spec
    │       └── views
    └── gems
        └── hello_world.       # ruby gem sinatra depends on
            ├── bin
            ├── data
            ├── exe
            ├── lib
            └── spec
```

As the goal of this small mono-repo is to be an example on which other Ruby Projects can be combined into a singular tree, we tried including various permutations of the Ruby libraries and applications, with inter-dependencies, external dependencies, and so on.

> NOTE: At the moment this Repo does NOT include a Ruby on Rails application, but that's coming soon.

It helps to start with the description of what is going on here:

#### Ruby Gem `hello_world`

Under `ruby/gems/hello_world` you would find a very simple Ruby Gem with a singular dependency on a gem called `colored2`. The gem's claim to fame is its ability to say "Hello World" in 74 languages. Powerful, right?

 * The Gem provides both Ruby SDK and the command line utility that can be called with a language-substring as a parameter.

 * You can test is as follows:

```bash
cd ruby/gems/hello_world
bundle install
# arguments are full or partial languages
bundle exec exe/hello-world ru af kaz uz geo
```

You might see something like the following output:

<a href="doc/hello-world-cli-example.jpg"><img src="doc/hello-world-cli-example.jpg" width="500"></a>

#### Ruby Sinatra Web App that uses `hello_world` gem

Under `ruby/apps/hello-world-web` you will find a simple Sinatra app that uses the `hello_world` gem, not via the Gemfile, but via direct relative path inclusion.

To test it without Bazel:

```bash
cd ruby/apps/hello-world-web
bundle install
bin/start
# .../ruby-monorepo/ruby/gems/hello_world/lib
# == Shotgun/Puma on http://127.0.0.1:9393/
# Puma starting in single mode...
# * Version 4.3.1 (ruby 2.5.5-p157), codename: Mysterious Traveller
# * Min threads: 0, max threads: 16
# * Environment: development
# * Listening on tcp://127.0.0.1:9393
# Use Ctrl-C to stop
```

If you click on [http://127.0.0.1:9393/](http://127.0.0.1:9393/) URL shown above, you should see a minimalistic user interface:

<a href="doc/web-ui.jpg"><img src="doc/web-ui.jpg" width="500"></a>

## Using Bazel to Build, Test and Run Ruby

This mono-repo depends on the [rules_ruby](https://github.com/bazelruby/rules_ruby) repository (`develop` branch).

Next examples we'll run from the top level folder of the project, but that's technically not necessary.

#### Bazel Workspace

This repo is a **Bazel Workspace**. It has a single `WORKSPACE` file at the top level, which, among other things, loads [`rules_ruby` project](https://github.com/bazelruby/rules_ruby) as a third party dependency.

All pure ruby code is under the `ruby` folder.

### Getting Around with Bazel

#### 1. Finding Available Targets

```bash
bazel query //...:all
#//ruby/gems/hello_world:specs
#//ruby/gems/hello_world:cli
#//ruby/apps/hello-world-web:server
#//ruby/gems/hello_world:lib
# Loading: 1 packages loaded
```

You can build all targets with:

```bash
bazel build //...:all  # shows targets available
#....  lots of output is skipped
```

As part of the output, you should see the result of two `bundle install` automatically called by Bazel Tooling.

#### 2. Running CLI via Bazel

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

#### 3. Running Gem Specs via Bazel

As one of the targets is `hello_world:specs` you can run it like so:

```bash
bazel test //ruby/gems/hello_world:specs
```

It's best to show the results of running specs in a screenshot:

<a href="doc/gem-tests.png"><img src="doc/gem-tests.png?a=1" width="640"></a>

#### 4. Running Sinatra Web Server via Bazel

This is, perhaps, the most complicated Bazel task in this repo to date. This is because it depends on it's own Bundle (and gems such as Puma), but it also depends on the internal library `hello_world`.

Here is the screenshot of running the server on the foreground, and hitting it a few times with requests:

<a href="doc/web-ui-bazel.jpg"><img src="doc/web-ui-bazel.jpg" width="500"></a>

---

### Feedback and Contributions

Please read and follow our [Code of Conduct](CODE_OF_CONDUCT.md), and we are very happy to accept help and pull requests or issues, or whatever you can contribute.

## Copyright

© 2019-2020 Konstantin Gredeskoul, Coinbase, & BazelRuby Authors

Licensed under the [Apache License](LICENSE), Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
