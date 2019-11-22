package(default_visibility = ["//visibility:public"])

exports_files(["ruby/gems/hello_world/Gemfile",
               "ruby/gems/hello_world/Gemfile.lock",
               "ruby/gems/hello_world/hello_world.gemspec"])

load("@bazelruby_ruby_rules//ruby:defs.bzl", "ruby_library")
load("@bazelruby_ruby_rules//ruby:defs.bzl", "ruby_test")
load("@bazelruby_ruby_rules//ruby:defs.bzl", "ruby_binary")
load("@bazelruby_ruby_rules//ruby:defs.bzl", "bundle_install")

ruby_library(
    name = "lib",
    srcs = glob(["lib/**/*.rb"]),
    )

ruby_binary(
    name = "cli",
    srcs = ["exe/hello-world"],
    main = "exe/hello-world",
    deps = [
        ":lib",
        "@hello_world-bundle//:libs"],
    )

separator = ' '

ruby_test(
    name = "specs",
    main = "spec/spec_helper.rb",
    rubyopt = ["-rrspec/autorun"],
    srcs = glob(["spec/**/*.rb"]),
    deps = [
        ":lib",
        "@hello_world-bundle//:libs"]
    )
