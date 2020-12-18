* Package to interact with Kubernetes cluster with client-go

Building the sample application with Bazel requires complicated setup.
For now we only use `go modules` and build with `go build`.

* Initialize Go modules `go mod init github.com/justicezyx/everywhere`
* Build: under the root of the repo, `go build src/k8s/k8s.go`
* The above command will update `go.mod`, but will eventually fail because of
  in compatibility between the packages fetched from the `head`. To fix that,
  set the versions of 3 related packages, k8s.io/{api, apimachinery, client-go},
  to the same version, as follows:
  ```
  k8s.io/api v0.19.0
  k8s.io/apimachinery v0.19.0
  k8s.io/client-go v0.19.0
  ```
