import 'package:test/test.dart';

void main() {
  test('String.split() splits the string on the delimiter', () {
    var string = 'game,of,life';
    expect(string.split(','), equals(['game', 'of', 'life']));
  });
}