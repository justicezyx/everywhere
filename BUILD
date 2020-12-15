load("@io_bazel_rules_docker//go:image.bzl", "go_image")
load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")
load("@bazel_gazelle//:def.bzl", "gazelle")

# gazelle:prefix github.com/justicezyx/everywhere
gazelle(name = "gazelle")

go_library(
    name = "go_default_library",
    srcs = ["http_server.go"],
    importpath = "github.com/justicezyx/everywhere",
    visibility = ["//visibility:private"],
)

go_binary(
    name = "http_server",
    embed = [":go_default_library"],
    visibility = ["//visibility:public"],
)

go_image(
    name = "http_server_image",
    binary = ":http_server",
)
