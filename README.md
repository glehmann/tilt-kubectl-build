An example of `kubectl_build` tilt extension usage

# Description

This project illustrates the usage of [BuildKit CLI for kubectl](https://github.com/vmware-tanzu/buildkit-cli-for-kubectl)
with tilt.

For that we'll build a custom image of keycloak — that could be to add a plugin for example — and
start keycloak in a local kubernetes cluster without ever using a local registry.

To do that, we just replace the usual `docker_build` in tilt by `image_build` from the
[kubectl_build extension](https://github.com/tilt-dev/tilt-extensions/tree/master/kubectl_build).

# Usage

You'll need `tilt`, `kubectl`, `kubectl build` and a compatible kubernetes cluster, like `kind`.
You (obviously!) don't need any local registry. An easy way to do that is with:

~~~bash
curl -sSL https://clk-project.org/install.sh | env CLK_EXTENSIONS=k8s bash
clk k8s --distribution kind flow
~~~

But just feel free to install all these tools the way you prefer!

Then just `tilt up`, and you're done. The image is built directly in the kubernetes
cluster. The application is available on http://localhost:8080
