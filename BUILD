load("@io_bazel_rules_docker//go:image.bzl", "go_image")
load("@io_bazel_rules_docker//container:container.bzl", "container_push")
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

# TODO(yzhao): This does not work yet. As the produced image cannot be executed
# with docker run, but kind actually can execute it on the local cluster.
# https://github.com/kubernetes-sigs/kind/issues/1984
# https://github.com/bazelbuild/rules_docker/issues/1701
container_push(
    name = "push_http_server_image",
    image = ":http_server_image",
    registry = "localhost:5000",
    format = "Docker",
    repository = "http_server",
    tag = "{BUILD_USER}",
)
