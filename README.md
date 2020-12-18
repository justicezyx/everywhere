# everywhere

Programming on single machine, cluster, and everywhere!

## Setup dev environment on Mac

* Install docker: https://docs.docker.com/docker-for-mac/install/
  * Configure docker:
    ```
    $ brew cask install virtualbox
    # Needs to enable virtual box:
    # System Preferences → Security & Privacy → General
    $ docker-machine create default
    ```
* Install bazel: https://docs.bazel.build/versions/master/install-os-x.html#install-with-installer-mac-os-x
* Install bazel docker rules: https://github.com/bazelbuild/rules_docker
* Install kind: https://kind.sigs.k8s.io/
* Setup local registry: https://kind.sigs.k8s.io/docs/user/local-registry/
