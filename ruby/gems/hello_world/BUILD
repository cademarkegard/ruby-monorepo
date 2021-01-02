package(default_visibility = ["//visibility:public"])

exports_files([
    "ruby/gems/hello_world/Gemfile",
    "ruby/gems/hello_world/Gemfile.lock",
    "ruby/gems/hello_world/hello_world.gemspec",
])

load("@bazelruby_rules_ruby//ruby:defs.bzl", "ruby_binary", "ruby_library", "ruby_rspec", "ruby_test")

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

ruby_rspec(
    name = "specs",
    size = "small",
    specs = glob(["spec/**/*.rb"]),
    srcs = [
        ":lib",
    ],
    rspec_args = {
        # NOTE: the output is only visible with --test_output=streamed flag
        "--format": "progress",  # this is how we can override rspec output format
    },
    deps = [
        "@bundle.hello-world-gem//:colored2",
    ],
    run_under = "ruby/gems/hello_world",
)