// import 'package:my_code_generator/code_generator.dart';
//
// void main(List<String> args) async {
//   if (args.isEmpty) {
//     print('Usage: dart bin/generate_widget.dart <widget_name>');
//     return;
//   }
//
//   print("===>>> ${args}");
//
//   final name = args.first;
//   await CodeGenerator.generateWidget2(args);
// }

import 'package:my_code_generator/code_generator.dart';

void main(List<String> arguments) {
  MyFlutterCli().generate(arguments);
}
