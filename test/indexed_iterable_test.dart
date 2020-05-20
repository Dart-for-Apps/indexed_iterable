import 'package:indexed_iterable/indexed_iterable.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('List to IndexedIterable', () {
      final list = [10, 1, 2, 3, 4, 5, 6];
      final ivList = <IndexedValue>[];
      for (var i = 0; i < list.length; i++) {
        ivList.add(IndexedValue(i, list[i]));
      }
      expect(list.ii, ivList);
    });
    test('Set to IndexedIterable', () {
      final testSet = {10, 1, 2, 3, 4, 5, 6};
      final ivList = <IndexedValue>[];
      var i = 0;
      for (final item in testSet) {
        ivList.add(IndexedValue(i++, item));
      }
      expect(testSet.ii, ivList);
    });
  });
}
