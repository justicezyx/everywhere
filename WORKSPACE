# bazel workspace

# Copied from https://github.com/bazelbuild/rules_docker#setup
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "1698624e878b0607052ae6131aa216d45ebb63871ec497f26c67455b34119c80",
    strip_prefix = "rules_docker-0.15.0",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.15.0/rules_docker-v0.15.0.tar.gz"],
)

# OPTIONAL: Call this to override the default docker toolchain configuration.
# This call should be placed BEFORE the call to "container_repositories" below
# to actually override the default toolchain configuration.
# Note this is only required if you actually want to call
# docker_toolchain_configure with a custom attr; please read the toolchains
# docs in /toolchains/docker/ before blindly adding this to your WORKSPACE.
# BEGIN OPTIONAL segment:
load(
    "@io_bazel_rules_docker//toolchains/docker:toolchain.bzl",
    docker_toolchain_configure = "toolchain_configure",
)

docker_toolchain_configure(
    name = "docker_config",
    # Additional configs can be found at https://github.com/bazelbuild/rules_docker
    # OPTIONAL: List of additional flags to pass to the docker command.
    docker_flags = [
        "--tls",
        "--log-level=info",
    ],
)

# End of OPTIONAL segment.
load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
)

container_pull(
    name = "java_base",
    registry = "gcr.io",
    repository = "distroless/java",
    # 'tag' is also supported, but digest is encouraged for reproducibility.
    digest = "sha256:deadbeef",
)

# Copied from https://github.com/bazelbuild/rules_docker#go_image
load(
    "@io_bazel_rules_docker//go:image.bzl",
    _go_image_repos = "repositories",
)

_go_image_repos()

# Copied from
# https://github.com/bazelbuild/bazel-gazelle#running-gazelle-with-bazel
#
# The go_rules_dependencies() go_register_toolchains() were removed because they
# do not seem needed. And go_register_toolchains() causes failures.
http_archive(
    name = "bazel_gazelle",
    sha256 = "b85f48fa105c4403326e9525ad2b2cc437babaa6e15a3fc0b1dbab0ab064bc7c",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.2/bazel-gazelle-v0.22.2.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.2/bazel-gazelle-v0.22.2.tar.gz",
    ],
)

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies", "go_repository")

gazelle_dependencies()

# Need to ping version as:
# https://github.com/kubernetes/client-go/issues/741#issuecomment-580957445
go_repository(
    name = "com_github_k8s_client-go",
    # v0.19.5
    commit = "77dfe4dff7d7060dfbd4e84da08134bf6b7f4907",
    importpath = "github.com/kubernetes/client-go",
)

go_repository(
    name = "com_github_k8s_apimachinery",
    commit = "15c5dba13c59f42b25aba4e3a6b17061af770216",
    importpath = "github.com/kubernetes/apimachinery",
)

go_repository(
    name = "io_k8s_api",
    build_file_proto_mode = "disable_global",
    commit = "2d6f90ab1293",
    importpath = "k8s.io/api",
)

go_repository(
    name = "io_k8s_client_go",
    build_file_proto_mode = "disable_global",
    commit = "59698c7d9724",
    importpath = "k8s.io/client-go",
)

go_repository(
    name = "io_k8s_apimachinery",
    build_file_proto_mode = "disable_global",
    commit = "103fd098999d",
    importpath = "k8s.io/apimachinery",
)

go_repository(
    name = "com_github_google_gofuzz",
    commit = "24818f796faf",
    importpath = "github.com/google/gofuzz",
)

go_repository(
    name = "com_github_golang_glog",
    commit = "23def4e6c14b",
    importpath = "github.com/golang/glog",
)

go_repository(
    name = "org_golang_x_time",
    commit = "fbb02b2291d2",
    importpath = "golang.org/x/time",
)

go_repository(
    name = "com_github_spf13_pflag",
    importpath = "github.com/spf13/pflag",
    tag = "v1.0.3",
)

go_repository(
    name = "com_github_imdario_mergo",
    importpath = "github.com/imdario/mergo",
    tag = "v0.3.5",
)

go_repository(
    name = "in_gopkg_inf_v0",
    importpath = "gopkg.in/inf.v0",
    tag = "v0.9.1",
)

go_repository(
    name = "org_golang_x_net",
    build_file_proto_mode = "disable_global",
    commit = "351d144fa1fc",
    importpath = "golang.org/x/net",
)

go_repository(
    name = "org_golang_x_crypto",
    commit = "505ab145d0a9",
    importpath = "golang.org/x/crypto",
)

go_repository(
    name = "com_github_peterbourgon_diskv",
    importpath = "github.com/peterbourgon/diskv",
    tag = "v2.0.1",
)

go_repository(
    name = "com_github_googleapis_gnostic",
    importpath = "github.com/googleapis/gnostic",
    sum = "h1:WeAefnSUHlBb0iJKwxFDZdbfGwkd7xRNuV+IpXMJhYk=",
    # This version is before the OpenAPIv2 renaming
    # https://github.com/DataDog/dd-trace-go/pull/585
    version = "v0.3.1",
)

go_repository(
    name = "com_github_json_iterator_go",
    importpath = "github.com/json-iterator/go",
    sum = "h1:Kz6Cvnvv2wGdaG/V8yMvfkmNiXq9Ya2KUv4rouJJr68=",
    version = "v1.1.10",
)

go_repository(
    name = "org_golang_x_text",
    importpath = "golang.org/x/text",
    tag = "v0.3.0",
)

go_repository(
    name = "org_golang_x_time",
    commit = "fbb02b2291d2",
    importpath = "golang.org/x/time",
)

go_repository(
    name = "org_golang_x_tools",
    commit = "6cd1fcedba52",
    importpath = "golang.org/x/tools",
)

go_repository(
    name = "com_github_beorn7_perks",
    commit = "3a771d992973",
    importpath = "github.com/beorn7/perks",
)

go_repository(
    name = "com_github_go_logr_logr",
    importpath = "github.com/go-logr/logr",
    tag = "v0.1.0",
)

go_repository(
    name = "com_github_go_logr_zapr",
    importpath = "github.com/go-logr/zapr",
    tag = "v0.1.0",
)

go_repository(
    name = "com_github_golang_protobuf",
    importpath = "github.com/golang/protobuf",
    tag = "v1.2.0",
)

go_repository(
    name = "com_github_mattbaird_jsonpatch",
    commit = "81af80346b1a",
    importpath = "github.com/mattbaird/jsonpatch",
)

go_repository(
    name = "com_github_matttproud_golang_protobuf_extensions",
    importpath = "github.com/matttproud/golang_protobuf_extensions",
    tag = "v1.0.1",
)

go_repository(
    name = "com_github_prometheus_client_golang",
    importpath = "github.com/prometheus/client_golang",
    tag = "v0.9.2",
)

go_repository(
    name = "com_github_prometheus_client_model",
    commit = "5c3871d89910",
    importpath = "github.com/prometheus/client_model",
)

go_repository(
    name = "com_github_prometheus_common",
    commit = "4724e9255275",
    importpath = "github.com/prometheus/common",
)

go_repository(
    name = "com_github_prometheus_procfs",
    commit = "1dc9a6cbc91a",
    importpath = "github.com/prometheus/procfs",
)

go_repository(
    name = "org_uber_go_atomic",
    importpath = "go.uber.org/atomic",
    tag = "v1.3.2",
)

go_repository(
    name = "org_uber_go_multierr",
    importpath = "go.uber.org/multierr",
    tag = "v1.1.0",
)

go_repository(
    name = "org_uber_go_zap",
    importpath = "go.uber.org/zap",
    tag = "v1.9.1",
)

go_repository(
    name = "com_github_google_pprof",
    commit = "3ea8567a2e57",
    importpath = "github.com/google/pprof",
)

go_repository(
    name = "org_golang_x_arch",
    commit = "5a4828bb7045",
    importpath = "golang.org/x/arch",
)

go_repository(
    name = "in_gopkg_yaml_v3",
    build_file_generation = "on",
    build_file_proto_mode = "disable",
    importpath = "gopkg.in/yaml.v3",
    replace = "gopkg.in/yaml.v3",
    sum = "h1:0efs3hwEZhFKsCoP8l6dDB1AZWMgnEl3yWXWRZTOaEA=",
    version = "v3.0.0-20190709130402-674ba3eaed22",
)

go_repository(
    name = "com_github_modern_go_concurrent",
    build_file_generation = "on",
    build_file_proto_mode = "disable",
    importpath = "github.com/modern-go/concurrent",
    sum = "h1:TRLaZ9cD/w8PVh93nsPXa1VrQ6jlwL5oN8l14QlcNfg=",
    version = "v0.0.0-20180306012644-bacd9c7ef1dd",
)

go_repository(
    name = "com_github_modern_go_reflect2",
    build_file_generation = "on",
    build_file_proto_mode = "disable",
    importpath = "github.com/modern-go/reflect2",
    sum = "h1:9f412s+6RmYXLWZSEzVVgPGK7C2PphHj5RJrvfx9AWI=",
    version = "v1.0.1",
)

go_repository(
    name = "com_github_gregjones_httpcache",
    build_file_generation = "on",
    build_file_proto_mode = "disable",
    importpath = "github.com/gregjones/httpcache",
    sum = "h1:f8eY6cV/x1x+HLjOp4r72s/31/V2aTUtg5oKRRPf8/Q=",
    version = "v0.0.0-20190212212710-3befbb6ad0cc",
)

go_repository(
    name = "com_github_google_btree",
    build_file_generation = "on",
    build_file_proto_mode = "disable",
    importpath = "github.com/google/btree",
    sum = "h1:0udJVsspx3VBr5FwtLhQQtuAsVc79tTq0ocGIPAU6qo=",
    version = "v1.0.0",
)

go_repository(
    name = "com_github_golang_protobuf",
    build_file_proto_mode = "disable_global",
    commit = "b5d812f8a3706043e23a9cd5babf2e5423744d30",
    importpath = "github.com/golang/protobuf",
    patches = [
        "@io_bazel_rules_go//third_party:com_github_golang_protobuf-extras.patch",
    ],
    patch_args = ["-p1"],
)

http_archive(
    name = "com_google_protobuf",
    strip_prefix = "protobuf-3.12.0",
    urls = ["https://github.com/protocolbuffers/protobuf/archive/v3.12.0.zip"],
)

http_archive(
    name = "zlib",
    build_file = "@com_google_protobuf//:third_party/zlib.BUILD",
    sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
    strip_prefix = "zlib-1.2.11",
    urls = [
        "https://mirror.bazel.build/zlib.net/zlib-1.2.11.tar.gz",
        "https://zlib.net/zlib-1.2.11.tar.gz",
    ],
)
