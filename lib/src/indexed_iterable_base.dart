/// This library offers the indexed range-based loop for `Iterable`
library indexed_iterable.indexed_iterable;

import 'dart:collection';
import 'package:indexed_iterable/indexed_iterable.dart';

import 'model/indexed_value.dart';

/// For the users who prefer functions than classes
IndexedIterable toII(Iterable _iterable) => II(_iterable);

/// Abbr for IndexedIterable
class II extends IndexedIterable {
  II(Iterable iterable) : super(iterable);
}

/// Main class implementing indexing for `Iterable`
class IndexedIterable with IterableMixin<IndexedValue> {
  IndexedIterable(this._iterable);

  final Iterable _iterable;

  @override
  Iterator<IndexedValue> get iterator => _IndexedIterableIterator(_iterable);
}

class _IndexedIterableIterator<ValueType> extends Iterator<IndexedValue> {
  _IndexedIterableIterator(this._iterable) {
    _innerIterator = _iterable.iterator;
  }

  final Iterable _iterable;
  Iterator _innerIterator;
  int _index = -1;

  @override
  IndexedValue get current => IndexedValue<ValueType>(_index, _innerIterator.current);

  @override
  bool moveNext() {
    _index++;
    return _innerIterator.moveNext();
  }
}

/// Alternative ways to convert iterables into IndexedIterable
extension IndexedIterableExtension on Iterable {
  IndexedIterable get indexedIterable => IndexedIterable(this);
  IndexedIterable get ii => indexedIterable;
  IndexedIterable get II => indexedIterable;
  IndexedIterable toII() => indexedIterable;
  IndexedIterable toIndexedIterable() => indexedIterable;
}
