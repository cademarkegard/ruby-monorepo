package(default_visibility = ["//visibility:public"])

exports_files([
    "ruby/gems/hello_world/Gemfile",
    "ruby/gems/hello_world/Gemfile.lock",
    "ruby/gems/hello_world/hello_world.gemspec",
])

load("@bazelruby_ruby_rules//ruby:defs.bzl", "ruby_binary", "ruby_library", "ruby_test")

ruby_library(
    name = "hello-world-lib",
    srcs = glob(["lib/**/*.rb"]),
)

ruby_binary(
    name = "cli",
    srcs = ["exe/hello-world"],
    main = "exe/hello-world",
    deps = [
        ":hello-world-lib",
        "@hello-world-bundle//:libs",
    ],
)

ruby_test(
    name = "specs",
    srcs = glob(["spec/**/*.rb"]),
    includes = ["ruby/gems/hello_world/lib"],
    main = "spec/spec_helper.rb",
    rubyopt = ["-rrspec/autorun"],
    deps = [
        ":hello-world-lib",
        "@hello-world-bundle//:libs",
    ],
)
