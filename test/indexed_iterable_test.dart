import 'package:indexed_iterable/indexed_iterable.dart';
import 'package:indexed_iterable/src/model/indexed_value.dart';
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

    test('Stream to IndexedStream', () async {
      final testStream = testStreamBuilder();
      var i = 0;
      await for (final ins in IndexedStream(testStream)) {
        expect(ins.index, i++);
        expect(ins.value, ins.index * 2);
      }
    });

    test('Map to IndexedMap', () async {
      final testMap = <String, String>{'hi': 'hihi', 'bye': 'byebye'};
      var i = 0;
      for (final im in IndexedMap(testMap)) {
        expect(im.index, i++);
        expect(im.value, testMap[im.key]);
      }
    });
  });
}

Stream<int> testStreamBuilder() async* {
  for (var i = 0; i < 10; i++) {
    yield i * 2;
  }
}
