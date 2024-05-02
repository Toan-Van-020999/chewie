import 'dart:async';

import 'package:flutter/material.dart';
///
/// The new State-Manager for Chewie!
/// Has to be an instance of Singleton to survive
/// over all State-Changes inside chewie
///
class PlayerNotifier extends ChangeNotifier {
  PlayerNotifier._(
    bool hideStuff,
  ) : _hideStuff = hideStuff;

  Timer? _zoomDisplayTimer;
  bool _isZooming = false;

  bool get isZooming => _isZooming;

  set isZooming(bool value) {
    _isZooming = value;
    notifyListeners();
  }

  void startZoomDisplayTimer() {
    _zoomDisplayTimer?.cancel();
    _zoomDisplayTimer = Timer(const Duration(seconds: 2), () {
      isZooming = false;
    });
  }

  void cancelZoomDisplayTimer() {
    _zoomDisplayTimer?.cancel();
  }


  bool _hideStuff;

  bool get hideStuff => _hideStuff;

  double _zoomValue = 1.0;

  set zoomValue(double value) {
    _zoomValue = value;
    notifyListeners();
  }

  double get zoomValue => _zoomValue;

  set hideStuff(bool value) {
    _hideStuff = value;
    notifyListeners();
  }

  // ignore: prefer_constructors_over_static_methods
  static PlayerNotifier init() {
    return PlayerNotifier._(
      true,
    );
  }
}
