import 'package:chaleno/chaleno.dart';
import 'package:chaleno/src/chaleno_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Parser? parser;

  setUp(() async {
    parser = await Chaleno().load('https://github.com/antonio-nicolau');
  });

  group('Test chaleno repository class', () {
    test('Get internet url', () {
      expect(parser?.html, isNotEmpty);
    });

    test('Get LocalHost with LocalHost name', () async {
      parser = await Chaleno().load('http://localhost/index');
      expect(parser?.html, isNotEmpty);
    });

    test('Get LocalHost with IP', () async {
      parser = await Chaleno().load('http://192.168.1.122/index');
      expect(parser?.html, isNotEmpty);
    });
  });

  group('Test Parser class', () {
    test('Extract data', () {
      expect(parser?.getElementsByClassName('repo').length, greaterThan(0));

      expect(parser?.getElementsByClassName('repo')[0].text,
          contains('cambio-diario'));
    });
  });

  group('Test result class', () {
    test('Result - tag value empty', () {
      expect(parser?.querySelectorAll('.repo')[0].src, isNull);
    });

    test('Result - tag value not empty', () {
      expect(parser?.querySelectorAll('.repo')[0].text, isNotNull);
    });
  });
}
