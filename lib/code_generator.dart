import 'dart:io';

class CodeGenerator {
  static Future<void> generateWidget(String name) async {
    // Validate name input
    if (name.isEmpty) {
      throw Exception('Please provide a valid widget name.');
    }
    // Construct the widget class content
    final className = name.pascalCase; // Convert to PascalCase
    final content = """
import 'package:flutter/material.dart';

class $className extends StatelessWidget {

    static final routes = [
  ];
  @override
  Widget build(BuildContext context) {
    return Text('$className Widget');
  }
}
""";

    // Create the widget file
    final filePath = 'lib/$name.dart';
    final file = File(filePath);
    await file.writeAsString(content);

    print('Widget file generated: $filePath');
  }

  static Map<String, dynamic> parseRouteArgs(List<String> args) {
    return {
      "name": args.first,
      "route": args[1],
    };
  }

  static Future<void> generateWidget2(List<String> args) async {
    if (args.isEmpty) {
      print(
          'Usage: dart bin/update_routes.dart <route_name> <route_path> [builder]');
      return;
    }

    const filePath = 'lib/my_widget.dart'; // Assuming class file path
    final content = File(filePath).readAsLinesSync();

    final route = parseRouteArgs(args); // Parse route information

    // (Simplified) Logic to modify the routes list
    int index = content.indexWhere((element) => element.contains("];"));

    content.insert(
      index,
      route.entries.map((e) => "'${e.key}': '${e.value}'").join(','),
    );

    // Write the updated content back to the file
    await File(filePath).writeAsString(content.join("\n"));

    print(
        'Route added to my_widgety_widget.dart: ${route['name']} -> ${route['path']}');
  }
}

extension StringExtension on String {
  String get pascalCase => replaceAll(RegExp(r'[^\w\s]+'), '')
      .replaceFirst(RegExp(r'^(\w)'), toString());
}
