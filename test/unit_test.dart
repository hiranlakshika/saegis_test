import 'package:flutter_test/flutter_test.dart';
import 'package:saegis_test/test_model.dart';

void main() {
  group('Testing test model', () {
    final testModel = TestModel();

    test('Testing Count', () {
      var count = testModel.getCount();
      expect(count, greaterThan(5));
      expect(count, lessThan(13));
    });

    test('Testing Max', () {
      var max = testModel.getMax();
      print('Marks max $max');
      expect(max, lessThanOrEqualTo(100));
      expect(max, greaterThanOrEqualTo(0));
    });

    test('Testing avg', () {
      var avg = testModel.getAvg();
      print('Avg $avg');
      expect(avg, greaterThan(50));
    } );
  });
}
