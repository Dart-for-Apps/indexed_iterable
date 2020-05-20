# Simple delegate for Indexed Itrables

This simple package offers a delegates to represent an `Iterable`,
like `List` and `set`, to be use in a range-based for loop with an index.

## Usage

If a class to use this package is based on `Iterable` class,
then you can use this package as follows.

```dart
import 'package:indexed_iterable/indexed_iterable.dart';

void main() {
  final testList = [1,2,3,4,2,2,3,4];
  for(final ii in IndexedIterable(testList)) {
    print(ii.index);
    print(ii.value);
  }
}
```

Instead of `IndexedIterable` constructor, you can use
`II(testList)`, `toII(testList)` functions, `testList.ii`,
`testList.II`, `testList.indexedIterable` extended getter
and `testList.toII()`, `testList.toIndexedIterable()` extended function. See the example and API docs.
