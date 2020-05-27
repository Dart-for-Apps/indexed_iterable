/// The return type of `IndexedXX`
class IndexedValue<ValueType> {
  IndexedValue(this.index, this.value);

  /// Index of the value
  final int index;

  /// Real value
  final ValueType value;

  @override
  String toString() => 'IV($index, $value)';

  /// For the test, this operator does not compare `hashValue`
  @override
  bool operator ==(other) => other is IndexedValue && index == other.index && value == other.value;
}
