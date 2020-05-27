/// This library offers the indexed range-based loop for `Iterable`
library indexed_iterable.indexed_iterable;

import 'dart:collection';
import 'package:indexed_iterable/indexed_iterable.dart';

import 'model/indexed_value.dart';

/// For the users who prefer functions than classes
IndexedIterable toII<T>(Iterable<T> _iterable) => II<T>(_iterable);

/// Abbr for IndexedIterable
class II<T> extends IndexedIterable<T> {
  II(Iterable iterable) : super(iterable);
}

/// Main class implementing indexing for `Iterable`
class IndexedIterable<T> with IterableMixin<IndexedValue<T>> {
  IndexedIterable(this._iterable);

  final Iterable _iterable;

  @override
  Iterator<IndexedValue<T>> get iterator => _IndexedIterableIterator<T>(_iterable);
}

class _IndexedIterableIterator<T> extends Iterator<IndexedValue<T>> {
  _IndexedIterableIterator(this._iterable) {
    _innerIterator = _iterable.iterator;
  }

  final Iterable _iterable;
  Iterator _innerIterator;
  int _index = -1;

  @override
  IndexedValue<T> get current => IndexedValue<T>(_index, _innerIterator.current);

  @override
  bool moveNext() {
    _index++;
    return _innerIterator.moveNext();
  }
}

/// Alternative ways to convert iterables into IndexedIterable
extension IndexedIterableExtension<T> on Iterable<T> {
  IndexedIterable<T> get indexedIterable => IndexedIterable<T>(this);
  IndexedIterable<T> get ii => indexedIterable;
  IndexedIterable<T> get II => indexedIterable;
  IndexedIterable<T> toII() => indexedIterable;
  IndexedIterable<T> toIndexedIterable() => indexedIterable;
}
