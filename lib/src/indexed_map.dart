/// This library offers the indexed range-based loop for `Map`
library indexed_iterable.indexed_map;

import 'dart:collection';

import 'model/indexed_map_entry.dart';

/// Delegate for indexed map
class IndexedMap<K, V> with IterableMixin<IndexedMapEntry> {
  IndexedMap(this._map);

  final Map<K, V> _map;

  @override
  Iterator<IndexedMapEntry<K, V>> get iterator => _IndexedMapIterator<K, V>(_map);
}

class _IndexedMapIterator<K, V> extends Iterator<IndexedMapEntry<K, V>> {
  _IndexedMapIterator(this._map) {
    _innerIterator = _map.keys.iterator;
  }

  final Map<K, V> _map;
  Iterator _innerIterator;
  int _index = -1;

  @override
  IndexedMapEntry<K, V> get current =>
      IndexedMapEntry<K, V>(_index, _innerIterator.current, _map[_innerIterator.current]);

  @override
  bool moveNext() {
    _index++;
    return _innerIterator.moveNext();
  }
}

/// Alternative ways to convert `Map`s into `IndexedMap`s
extension IndexedMapExtension<K, V> on Map<K, V> {
  IndexedMap<K, V> get indexedMap => IndexedMap<K, V>(this);
  IndexedMap<K, V> get im => indexedMap;
  IndexedMap<K, V> get IM => im;
  IndexedMap<K, V> toIM() => IM;
  IndexedMap<K, V> toIndexedMap() => IM;
}
