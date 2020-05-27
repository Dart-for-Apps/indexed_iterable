/// This library offers the indexed range-based loop for `Map`
library indexed_iterable.indexed_map;

import 'dart:collection';

import 'model/indexed_map_entry.dart';

/// Delegate for indexed map
class IndexedMap with IterableMixin<IndexedMapEntry> {
  IndexedMap(this._map);

  final Map _map;

  @override
  Iterator<IndexedMapEntry> get iterator => _IndexedMapIterator(_map);
}

class _IndexedMapIterator extends Iterator<IndexedMapEntry> {
  _IndexedMapIterator(this._map) {
    _innerIterator = _map.keys.iterator;
  }

  final Map _map;
  Iterator _innerIterator;
  int _index = -1;

  @override
  IndexedMapEntry get current =>
      IndexedMapEntry(_index, _innerIterator.current, _map[_innerIterator.current]);

  @override
  bool moveNext() {
    _index++;
    return _innerIterator.moveNext();
  }
}

/// Alternative ways to convert `Map`s into `IndexedMap`s
extension IndexedMapExtension on Map {
  IndexedMap get indexedMap => IndexedMap(this);
  IndexedMap get im => indexedMap;
  IndexedMap get IM => im;
  IndexedMap toIM() => IM;
  IndexedMap toIndexedMap() => IM;
}
