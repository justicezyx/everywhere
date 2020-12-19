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

## TODO

* Shell script to automate the build, deploy on local Kind cluster.
* [Chris] Have a dedicated agent on K8s cluster to accept application
  deployment requests.
  * The development process during the development of k8s applications.
* Continue on the service automation direction. For now.
  * Create service object.
  * Start auto-scaling.
* Take a look at Operator framework.

## Discussion

* What really is useful for developers?
  * Get started with service management
