# Workspace
# RubyBazel Project for demonstrating how ruby_rules work with internal & extnernal gems.

workspace(name = "bazelruby_ruby_monorepo")

load(
    "@bazel_tools//tools/build_defs/repo:git.bzl",
    "git_repository",
)

git_repository(
    name = "bazelruby_ruby_rules",
    branch = "develop",
    remote = "https://github.com/bazelruby/rules_ruby.git",
)

load(
    "@bazelruby_ruby_rules//ruby:deps.bzl",
    "ruby_register_toolchains",
    "ruby_rules_dependencies",
)

ruby_rules_dependencies()

ruby_register_toolchains(version = "2.6.5")

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

load("@bazelruby_ruby_rules//ruby:defs.bzl", "bundle_install")

bundle_install(
    name = "bundle",
    gemfile = "//:Gemfile",
    gemfile_lock = "//:Gemfile.lock",
    version = "2.0.2",
    visibility = ["//visibility:public"],
)
