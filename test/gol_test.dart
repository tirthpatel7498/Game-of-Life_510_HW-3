import 'package:test/test.dart';

void main() {
  test('String.split() splits the string on the delimiter', () {
    var string = 'Game,of,Life';
    expect(string.split(','), equals(['Game', 'of', 'Life']));
  });
}