/// The return type of `IndexedXX`
class IndexedMapEntry<KeyType, ValueType> {
  IndexedMapEntry(this.index, this.key, this.value);

  /// Index of the value
  final int index;

  /// key for a `MapEntry`
  final KeyType key;

  /// value for a `MapEntry`
  final ValueType value;

  @override
  String toString() => 'IV($index, $value)';

  /// For the test, this operator does not compare `hashValue`
  @override
  bool operator ==(other) =>
      other is IndexedMapEntry &&
      index == other.index &&
      value == other.value &&
      key == other.key;
}
