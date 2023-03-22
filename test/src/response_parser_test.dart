import 'dart:io';

import 'package:rovio/src/response_parser.dart';
import 'package:test/test.dart';

void main() {
  group('ResponseParser', () {
    test('parses report', () {
      final stub = File('${Directory.current.path}/test/stubs/movement_get_report.txt');

      final result = ResponseParser(stub.readAsStringSync()).parse();

      expect(result['Cmd'], equals('nav'));
      expect(result['speaker_volume'], equals('22'));
    });

    test('parses status', () {
      final stub = File('${Directory.current.path}/test/stubs/movement_get_status.txt');

      final result = ResponseParser(stub.readAsStringSync()).parse();

      expect(result['Cmd'], equals('nav'));
      expect(result['state'], equals('0'));
    });

    test('parses tuning parameters', () {
      final stub = File('${Directory.current.path}/test/stubs/movement_get_tuning_parameters.txt');

      final result = ResponseParser(stub.readAsStringSync()).parse();

      expect(result['Cmd'], equals('nav'));
      expect(result['HomingTurn'], equals('9'));
      expect(result['DockTimeout'], equals('72'));
    });
  });
}
