#!/usr/bin/env python

config.define_bool("no-volumes")
cfg = config.parse()

load('ext://kubectl_build', 'image_build')
load('ext://helm_remote', 'helm_remote')

image_build("gcr.io/example/keycloak", ".")
helm_remote('keycloak',
    repo_url="https://charts.bitnami.com/bitnami",
    version="2.4.3",
    values=["values.yaml"],
)
k8s_resource('keycloak', port_forwards='8080:8080')

if config.tilt_subcommand == 'down' and not cfg.get("no-volumes"):
  local('kubectl --context ' + k8s_context() + ' delete pvc --selector=app.kubernetes.io/instance=keycloak --wait=false')
