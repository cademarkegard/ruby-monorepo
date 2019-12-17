package(default_visibility = ["//visibility:public"])

load("@bazelruby_ruby_rules//ruby:defs.bzl", "ruby_binary", "ruby_library", "ruby_test")

ruby_binary(
    name = "rubocop",
    srcs =
        glob(["**/*.rb"]) + [
            "//:.rubocop.yml",
            "@bundle//:bin/rubocop",
        ],
    main = "@bundle//:bin/rubocop",
    deps = [
        "@bundle//:jaro_winkler",
        "@bundle//:parser",
        "@bundle//:rainbow",
        "@bundle//:rubocop",
        "@bundle//:ruby-progressbar",
        "@bundle//:unicode-display_width",
    ],
)
