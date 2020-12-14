// Package k8s provides APIs to interact with k8s cluster.
package k8s

// Use kubernetes/client-go's rest.InClusterConfig(), if returns ErrNotInCluster, then its not running on kubernetes,
// Then it can determine whether or not to launch itself.
//
// The first step is to launch a container on kubernetes without kubectl.
