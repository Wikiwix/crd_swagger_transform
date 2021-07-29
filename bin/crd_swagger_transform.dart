import 'dart:convert';
import 'dart:io';

Future<void> main(List<String> arguments) async {
  final inputString = await systemEncoding.decodeStream(stdin);
  final dynamic kubectlOut = jsonDecode(inputString);
  final crds = kubectlOut['items'] as List;
  final crdMap = {
    for (final crd in crds)
      for (final version in crd['spec']['versions'])
        '${crd['metadata']['name']}/${version['name']}': {
          'type': 'object',
          'description': version['schema']['openAPIV3Schema']['description'],
          'properties': version['schema']['openAPIV3Schema']['properties'],
        },
  };
  final openApi = {
    'swagger':
        '2.0', // 'openapi': '3.0.3' unfortunately does not show the unused definitions
    'info': {'title': 'CRDs', 'version': '0.0.1'},
    'paths': {},
    'definitions': crdMap,
  };
  stdout.writeln(const JsonEncoder.withIndent('  ').convert(openApi));
}
