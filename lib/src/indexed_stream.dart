/// This library offers the indexed range-based async loop for `Stream`
library indexed_iterable.indexed_stream;

import 'dart:async';

import 'model/indexed_value.dart';

///Concise the conversion
Stream<IndexedValue> IndexedStream<T>(Stream<T> s) => s.IS;

/// For the users who prefer functions than classes
Stream<IndexedValue> toIndexedStream<T>(Stream<T> s) => s.IS;

/// For the users who prefer abbreviated functions
Stream<IndexedValue> toIS<T>(Stream<T> s) => s.IS;

class _IndexedStreamTransformer<T> extends StreamTransformerBase<T, IndexedValue<T>> {
  _IndexedStreamTransformer();
  int index = 0;

  void handleIndexing(data, EventSink sink) {
    sink.add(IndexedValue<T>(index++, data));
  }

  @override
  Stream<IndexedValue<T>> bind(Stream<T> stream) {
    return stream.transform(StreamTransformer.fromHandlers(handleData: handleIndexing));
  }
}

/// Alternative ways to convert `Stream` into `IndexedStream`
extension IndexedStreamExtension<T> on Stream<T> {
  Stream<IndexedValue<T>> toIndexedStream() => _IndexedStreamTransformer<T>().bind(this);
  Stream<IndexedValue<T>> toIS() => toIndexedStream();
  Stream<IndexedValue<T>> get IS => toIS();
  Stream<IndexedValue<T>> get indexedStream => IS;
}
