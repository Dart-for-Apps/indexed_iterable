import 'package:indexed_iterable/indexed_iterable.dart';

void main() {
  final testSet = {1, 2, 3, 4, 5, 6, 7};
  final testList = [1, 2, 3, 4, 5, 6, 7];
  print('Test 1');
  for (final it in IndexedIterable(testSet)) {
    print(it);
  }
  print('Test 2');
  for (final it in IndexedIterable(testList)) {
    print(it);
  }
  print('Test 3');
  for (final it in II({'hi': 2})) {
    // Because `map` is not a `Iterable`, this loop does not proceed.
    print(it);
  }

  print('Test 4');
  for (final it in testList.ii) {
    print(it);
  }
}
