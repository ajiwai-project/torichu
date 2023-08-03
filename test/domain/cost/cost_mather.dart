import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_test/flutter_test.dart';

class CostMatcherWithoutId extends Matcher {
  final Cost expectedCost;

  CostMatcherWithoutId(this.expectedCost);

  @override
  Description describe(Description description) {
    return description.add('Cost: ${expectedCost.toString()}');
  }

  @override
  bool matches(item, Map matchState) {
    return item is Cost &&
        item.title == expectedCost.title &&
        item.amount == expectedCost.amount &&
        item.category == expectedCost.category &&
        item.point == expectedCost.point;
  }
}
