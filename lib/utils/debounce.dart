import 'dart:async';

import 'package:flutter/material.dart';

class Debounce {
  final int miliseconds;

  Debounce({this.miliseconds = 500});

  Timer? _timer;

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: miliseconds), action);
  }
}
