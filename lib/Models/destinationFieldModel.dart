import 'package:flutter/material.dart';

class DestinationFieldModel extends ChangeNotifier {
  static String _destination = "";

  String get destination => _destination;

  set destination(String destination) {
    _destination = destination;
    notifyListeners();
  }
}


