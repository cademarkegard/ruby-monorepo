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

ruby_register_toolchains()

load("@bazelruby_ruby_rules//ruby:defs.bzl", "bundle_install")

bundle_install(
    name = "bundle.hello-world-gem",
    gemfile = "//ruby/gems/hello_world:Gemfile",
    gemfile_lock = "//ruby/gems/hello_world:Gemfile.lock",
    #gemspec = "//ruby/gems/hello_world:hello_world.gemspec",
    visibility = ["//visibility:public"],
)

bundle_install(
    name = "bundle.hello-world-web",
    gemfile = "//ruby/apps/hello-world-web:Gemfile",
    gemfile_lock = "//ruby/apps/hello-world-web:Gemfile.lock",
    visibility = ["//visibility:public"],
)
