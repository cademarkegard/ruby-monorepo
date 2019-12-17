package(default_visibility = ["//visibility:public"])

exports_files([
    "ruby/gems/hello_world/Gemfile",
    "ruby/gems/hello_world/Gemfile.lock",
])

load("@bazelruby_ruby_rules//ruby:defs.bzl", "ruby_binary", "ruby_library", "ruby_test")

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
        "@bundle//:colored2",
        "@bundle//:rake",
    ],
)

ruby_test(
    name = "specs",
    timeout = "short",
    srcs = glob(["spec/**/*_spec.rb"]) + [
        "spec/spec_helper.rb",
    ],
    includes = ["ruby/gems/hello_world/lib"],
    main = "spec/spec_helper.rb",
    rubyopt = ["-rrspec/autorun"],
    deps = [
        ":lib",
        "@bundle//:colored2",
        "@bundle//:rspec",
    ],
)
