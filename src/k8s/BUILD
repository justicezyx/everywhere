load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")

go_library(
    name = "go_default_library",
    srcs = ["k8s.go"],
    importpath = "github.com/justicezyx/everywhere/src/k8s",
    visibility = ["//visibility:public"],
    deps = [
        "@io_k8s_api//apps/v1:go_default_library",
        "@io_k8s_api//core/v1:go_default_library",
        "@io_k8s_apimachinery//pkg/apis/meta/v1:go_default_library",
        "@io_k8s_client_go//kubernetes:go_default_library",
        "@io_k8s_client_go//tools/clientcmd:go_default_library",
        "@io_k8s_client_go//util/homedir:go_default_library",
        "@io_k8s_client_go//util/retry:go_default_library",
    ],
)

go_binary(
    name = "k8s",
    embed = [":go_default_library"],
    visibility = ["//visibility:public"],
)
