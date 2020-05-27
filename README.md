# Simple delegate for Indexed Itrables

This simple package offers a delegates to represent an `Iterable`,
like `List` and `set`, to be use in a range-based for loop with an index.

# Usage

If a class to use this package is based on `Iterable` class,
then you can use this package as follows.

See the API references for the details.

## IndexedIterable

`IndexedIterable` offers the ability to provide range-based loop with 0-based index
for `Iterable`s like `List` and `Set.

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

## IndexedMap

`IndexedMap` offers the ability to provide range-based loop with 0-based index
for `Map`.

```dart
import 'package:indexed_iterable/indexed_iterable.dart';
void main() {
  final testMap = {'hi':'hihi', 'bye':'byebye'};
  for(final im in IndexedMap(testMap)) {
    // im.index => 0-based index
    // im.key => key
    // im.value => value
  }
}
```

## IndexedStream

`IndexedStream` offers the ability to provide range-based async loop with 0-based index
for `Stream`.

```dart
import 'package:indexed_iterable/indexed_iterable.dart';
void main() async {
  /// testStream => some stream you want to handle
  for(final im in IndexedStream(testStream)) {
    // im.index => 0-based index
    // im.value => value
  }
}
```
