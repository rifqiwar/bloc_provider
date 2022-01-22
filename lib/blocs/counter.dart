import 'dart:async';

class CounterBlock {
  int _counter = 0;

  int get counter => _counter;

  // ignore: prefer_final_fields
  StreamController _inputController = StreamController();
  StreamSink get inputan => _inputController.sink;

  // ignore: prefer_final_fields
  StreamController _outputController = StreamController();
  StreamSink get _sinkOut => _outputController.sink;

  Stream get outputan => _outputController.stream;
  CounterBlock() {
    _inputController.stream.listen(
      (event) {
        if (event == 'add') {
          _counter++;
        } else {
          _counter--;
        }

        _sinkOut.add(_counter);
      },
    );
  }

  void dispose() {
    _inputController.close();
    _outputController.close();
  }
}
