/// This library offers the indexed range-based async loop for `Stream`
library indexed_iterable.indexed_stream;

import 'dart:async';

import 'model/indexed_value.dart';

///Concise the conversion
Stream<IndexedValue> IndexedStream(Stream s) => s.IS;

/// For the users who prefer functions than classes
Stream<IndexedValue> toIndexedStream(Stream s) => s.IS;

/// For the users who prefer abbreviated functions
Stream<IndexedValue> toIS(Stream s) => s.IS;

class _IndexedStreamTransformer<InputType> extends StreamTransformerBase<InputType, IndexedValue> {
  _IndexedStreamTransformer();
  int index = 0;

  void handleIndexing(data, EventSink sink) {
    sink.add(IndexedValue(index++, data));
  }

  @override
  Stream<IndexedValue> bind(Stream<InputType> stream) {
    return stream.transform(StreamTransformer.fromHandlers(handleData: handleIndexing));
  }
}

/// Alternative ways to convert `Stream` into `IndexedStream`
extension IndexedStreamExtension on Stream {
  Stream<IndexedValue> toIndexedStream() => _IndexedStreamTransformer().bind(this);
  Stream<IndexedValue> toIS() => toIndexedStream();
  Stream<IndexedValue> get IS => toIS();
  Stream<IndexedValue> get indexedStream => IS;
}
