package(default_visibility = ["//visibility:public"])

exports_files([
    "ruby/gems/hello_world/Gemfile",
    "ruby/gems/hello_world/Gemfile.lock",
    "ruby/gems/hello_world/hello_world.gemspec",
])

load("@bazelruby_rules_ruby//ruby:defs.bzl", "ruby_binary", "ruby_library", "ruby_test")

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
        "@bundle.hello-world-gem//:colored2",
    ],
)

ruby_test(
    name = "specs",
    size = "small",
    srcs = glob(["spec/**/*.rb"]),
    includes = ["ruby/gems/hello_world/lib"],
    main = "spec/spec_helper.rb",
    rubyopt = ["-rrspec/autorun"],
    deps = [
        ":lib",
        "@bundle.hello-world-gem//:colored2",
        "@bundle.hello-world-gem//:rake",
        "@bundle.hello-world-gem//:rspec"
    ],
)
