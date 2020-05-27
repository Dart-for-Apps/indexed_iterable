import 'package:indexed_iterable/indexed_iterable.dart';

void main() async {
  final testSet = {1, 2, 3, 4, 5, 6, 7};
  final testList = [1, 2, 3, 4, 5, 6, 7];
  print('Test 1 - Indexed Set 1');
  for (final it in IndexedIterable(testSet)) {
    print(it);
  }
  print('Test 2 - Indexed List 1');
  for (final it in IndexedIterable(testList)) {
    print(it);
  }

  print('Test 3 - Indexed List 2');
  for (final it in testList.ii) {
    print(it);
  }

  print('Test 4 - Indexed Stream');
  final testStream = streamBuilder();

  await for (final ins in IndexedStream(testStream)) {
    print(ins);
  }

  print('Test 5 - IndexedMap 1');
  final testMap = {'hi': 'hihi', 'bye': 'byebye'};
  for (final im in IndexedMap(testMap)) {
    print(im);
  }
}

Stream streamBuilder() async* {
  for (var i = 0; i < 10; i++) {
    yield i * 2;
  }
}
