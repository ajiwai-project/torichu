import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_test/flutter_test.dart';

class _CostMatcherWithoutIdAndRegisteredAt extends Matcher {
  final Cost expectedCost;

  _CostMatcherWithoutIdAndRegisteredAt(this.expectedCost);

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
        item.point == expectedCost.point &&
        item.tags == expectedCost.tags;
  }
}

Matcher matchingWithoutIdAndRegisteredAt(Cost expected) {
  return _CostMatcherWithoutIdAndRegisteredAt(expected);
}

class _CostMatcherWithoutId extends Matcher {
  final Cost expectedCost;

  _CostMatcherWithoutId(this.expectedCost);

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
        item.point == expectedCost.point &&
        item.registeredAt == expectedCost.registeredAt &&
        item.tags == expectedCost.tags;
  }
}

Matcher matchingWithoutId(Cost expected) {
  return _CostMatcherWithoutId(expected);
}
