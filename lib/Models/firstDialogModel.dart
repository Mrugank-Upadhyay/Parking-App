import 'package:flutter/material.dart';

enum Distance {
  UNKNOWN,
  LESS_THAN_2_MINS,
  LESS_THAN_5_MINS,
  LESS_THAN_10_MINS,
  MORE_THAN_10_MINS
}

class FirstDialogModel extends ChangeNotifier {
  Distance _distance = Distance.UNKNOWN;
  bool needsHandiCap = false;

  Map<Distance, Color> distanceChipsBackground = {
    Distance.LESS_THAN_2_MINS: Colors.white,
    Distance.LESS_THAN_5_MINS: Colors.white,
    Distance.LESS_THAN_10_MINS: Colors.white,
    Distance.MORE_THAN_10_MINS: Colors.white,
  };

  Map<Distance, Color> distanceChipsText = {
    Distance.LESS_THAN_2_MINS: Colors.grey.shade800,
    Distance.LESS_THAN_5_MINS: Colors.grey.shade800,
    Distance.LESS_THAN_10_MINS: Colors.grey.shade800,
    Distance.MORE_THAN_10_MINS: Colors.grey.shade800,
  };

  // Clean this up a bit, we can actually just directly change this in max 5 lines
  Color chipBackgroundColor(String label, Color color) {
    switch (label) {
      case "LESS_THAN_2_MINS":
        distanceChipsBackground[Distance.LESS_THAN_2_MINS] = color;
        break;
      case "LESS_THAN_5_MINS":
        distanceChipsBackground[Distance.LESS_THAN_5_MINS] = color;
        break;
      case "LESS_THAN_10_MINS":
        distanceChipsBackground[Distance.LESS_THAN_10_MINS] = color;
        break;
      case "MORE_THAN_10_MINS":
        distanceChipsBackground[Distance.MORE_THAN_10_MINS] = color;
        break;
    }

    for (var chip in distanceChipsBackground.keys) {
      if (chip.toString().substring(9) != label) {
        distanceChipsBackground[chip] = Colors.white;
      }
    }
    _chipTextColor(label, Colors.white);
    notifyListeners();
    return color;
  }

  Color _chipTextColor(String label, Color color) {
    switch (label) {
      case "LESS_THAN_2_MINS":
        distanceChipsText[Distance.LESS_THAN_2_MINS] = color;
        break;
      case "LESS_THAN_5_MINS":
        distanceChipsText[Distance.LESS_THAN_5_MINS] = color;
        break;
      case "LESS_THAN_10_MINS":
        distanceChipsText[Distance.LESS_THAN_10_MINS] = color;
        break;
      case "MORE_THAN_10_MINS":
        distanceChipsText[Distance.MORE_THAN_10_MINS] = color;
        break;
    }

    for (var chip in distanceChipsText.keys) {
      if (chip.toString().substring(9) != label) {
        distanceChipsText[chip] = Colors.grey.shade800;
      }
    }
    notifyListeners();
    return color;
  }

  get distance => _distance;

  set distance(Distance distance) {
    _distance = distance;
    print(_distance);
    notifyListeners();
  }

  get handiCap => needsHandiCap;

  set handiCap(bool isHandiCapped) {
    needsHandiCap = isHandiCapped;
    notifyListeners();
  }
}
