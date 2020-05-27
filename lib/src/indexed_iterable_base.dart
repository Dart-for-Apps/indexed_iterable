import 'dart:collection';

IndexedIterable II(_iterable) =>
    _iterable is Iterable ? IndexedIterable(_iterable) : IndexedIterable([]);

IndexedIterable toII(_iterable) => II(_iterable);

class IndexedIterable with IterableMixin {
  IndexedIterable(this._iterable);

  final Iterable _iterable;

  @override
  Iterator get iterator => IndexedIterator(_iterable);
}

class IndexedIterator<ValueType> extends Iterator {
  IndexedIterator(this._iterable) {
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

class IndexedValue<ValueType> {
  IndexedValue(this.index, this.value);

  /// Index of the value
  final int index;

  /// Real value
  final ValueType value;

  @override
  String toString() => 'IV($index, $value)';

  @override
  bool operator ==(other) => other is IndexedValue && index == other.index && value == other.value;
}

extension IndexedIterableExtension on Iterable {
  IndexedIterable get indexedIterable => IndexedIterable(this);
  IndexedIterable get ii => indexedIterable;
  IndexedIterable get II => indexedIterable;
  IndexedIterable toII() => indexedIterable;
  IndexedIterable toIndexedIterable() => indexedIterable;
}
