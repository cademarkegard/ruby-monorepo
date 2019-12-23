package(default_visibility = ["//visibility:public"])

load("@bazelruby_ruby_rules//ruby:defs.bzl", "ruby_binary")

ruby_binary(
    name = "rubocop",
    srcs = [
        "//:.relaxed-rubocop-2.4.yml",
        "//:.rubocop.yml",
        "//ruby/apps/hello-world-web:server",
        "//ruby/gems/hello_world:lib",
        "@bundle//:bin/rubocop",
    ],
    args = [
        "-c",
        ".rubocop.yml",
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
