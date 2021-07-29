# `crd_swagger_transform`

This tool expects the output of `kubectl get crd --output=json` via `stdin` and prints a Swagger JSON to `stdout`

Graphical output can be looked at (for example) on the [Swagger Editor webservice](https://editor.swagger.io/)

## Usage

If Dart is installed on your system, you can install the tool using

```sh
 dart pub global activate --source git https://github.com/Wikiwix/crd_swagger_transform.git
```

and following the steps in the [Dart documentation](https://dart.dev/tools/pub/cmd/pub-global#running-a-script).

Then the tool can be used like

```sh
kubectl get crds --output=json | crdswag > swagger-crds.json
```
