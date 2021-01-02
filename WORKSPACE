# Workspace
# BazelRuby project for demonstrating how ruby_rules work with internal & external gems.

workspace(name = "bazelruby_ruby_monorepo")

load(
    "@bazel_tools//tools/build_defs/repo:git.bzl",
    "git_repository",
)

# Note I had to port a feature (rununder) from coinbase's fork
# to get the rspec feature working correctly
git_repository(
    name = "bazelruby_rules_ruby",
    shallow_since = "1609559912 +0000",
    commit = "c11c84dea18c681e895cf63322b5f807c0fc492f",
    remote = "https://github.com/cademarkegard/rules_ruby.git",
)

load(
    "@bazelruby_rules_ruby//ruby:deps.bzl",
    "rules_ruby_dependencies",
    "rules_ruby_select_sdk"
)

rules_ruby_dependencies()

rules_ruby_select_sdk(version = "2.7.1")

load("@bazelruby_rules_ruby//ruby:defs.bzl", "ruby_bundle")

ruby_bundle(
    name = "bundle.hello-world-gem",
    gemfile = "//ruby/gems/hello_world:Gemfile",
    gemfile_lock = "//ruby/gems/hello_world:Gemfile.lock",
    visibility = ["//visibility:public"],
)

ruby_bundle(
    name = "bundle.hello-world-web",
    gemfile = "//ruby/apps/hello-world-web:Gemfile",
    gemfile_lock = "//ruby/apps/hello-world-web:Gemfile.lock",
    visibility = ["//visibility:public"],
)

# Had to add this to get rspec example working
ruby_bundle(
    name = "bundle",
    gemfile = "//ruby/apps/hello-world-web:Gemfile",
    gemfile_lock = "//ruby/apps/hello-world-web:Gemfile.lock",
    visibility = ["//visibility:public"],
)
