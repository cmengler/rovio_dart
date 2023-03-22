import 'dart:convert';

class ResponseParser {
  ResponseParser(this.data);

  final String data;

  Map<String, dynamic> parse() {
    final result = <String, dynamic>{};
    final lines = LineSplitter.split(data).toList();

    // read the command line
    result['Cmd'] = lines[0].substring(lines[0].indexOf('=') + 1).trim();

    // read the data lines
    for (var i = 1; i < lines.length; i++) {
      final keyValues = lines[i].split('|');
      for (final keyValue in keyValues) {
        if (keyValue.isEmpty) {
          continue;
        }
        final parts = keyValue.split('=');
        result[parts[0].trim()] = parts[1].trim();
      }
    }

    return result;
  }
}
