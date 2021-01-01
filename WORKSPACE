# Workspace
# BazelRuby project for demonstrating how ruby_rules work with internal & external gems.

workspace(name = "bazelruby_ruby_monorepo")

load(
    "@bazel_tools//tools/build_defs/repo:git.bzl",
    "git_repository",
)

# Note we lock down the bazelruby rules to a specific commit
# for the tag v0.4.1: https://github.com/bazelruby/rules_ruby/releases/tag/v0.4.1
git_repository(
    name = "bazelruby_rules_ruby",
    commit = "6e5be6e0f67f73a4458f60d0f776e179424d7a29",
    shallow_since = "1597040609 -0700",
    remote = "https://github.com/bazelruby/rules_ruby.git",
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
