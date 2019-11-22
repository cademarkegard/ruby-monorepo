# Workspace
# RubyBazel Project for demonstrating how ruby_rules work with internal & extnernal gems.

workspace(name = "bazelruby_ruby_monorepo")

load("@bazel_tools//tools/build_defs/repo:git.bzl",
     "git_repository"
     )

git_repository(
    name = "bazelruby_ruby_rules",
    remote = "https://github.com/bazelruby/rules_ruby.git",
    commit = "7bac285104c0e09d9cbe322f484711c900cf279e"
)

# Importing rules_ruby from the parent directory for developing
# rules_ruby itself...
# local_repository(
#    name = "bazelruby_ruby_rules",
#    path = "/Users/kig/bazel/ruby-monorepo",
#)

load(
    "@bazelruby_ruby_rules//ruby:deps.bzl",
    "ruby_register_toolchains",
    "ruby_rules_dependencies",
)

ruby_register_toolchains()

ruby_rules_dependencies()

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

load("@bazelruby_ruby_rules//ruby:defs.bzl", "bundle_install")

bundle_install(
    name = "hello_world-bundle",
    gemfile = "//ruby/gems/hello_world:Gemfile",
    gemfile_lock = "//ruby/gems/hello_world:Gemfile.lock",
    #gemspec = "//ruby/gems/hello_world:hello_world.gemspec",
    visibility = ["//visibility:public"]
)
