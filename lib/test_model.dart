import 'dart:math';
import 'package:collection/collection.dart';

class TestModel {
  List<double> marks = [35, 44, 89, 99, 77, 45, 12, 65, 47, 82, 27, 66];

  int getCount() {
    return marks.length;
  }

  double getMax() {
    return marks.reduce(max);
  }

  double getMin() {
    return marks.reduce(min);
  }

  double getAvg() {
    return marks.average;
  }
}
