import 'package:flutter_test/flutter_test.dart';
import 'package:layered_archtecture_sample/util/datetime_converter.dart';

void main() {
  test('任意のDatetime型オブジェクトがyyyy/MM/dd形式のString型に変換されること', () {
    final now = DateTime(2024, 1, 1).toFormatDateString;
    expect(now, '2024/01/01');
  });
}
