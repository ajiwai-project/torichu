import 'package:flutter_template/domain/cost/category.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/point.dart';

class CostBuilder {
  String id = 'dummy';
  String title = 'dummy';
  int amount = -1;
  Point point = Point.one;
  Category category = Category.food;
  DateTime registeredAt = DateTime(1900, 1, 1, 1);

  CostBuilder setTitle(String title) {
    this.title = title;
    return this;
  }

  CostBuilder setAmount(int amount) {
    this.amount = amount;
    return this;
  }

  CostBuilder setPoint(Point point) {
    this.point = point;
    return this;
  }

  CostBuilder setCategory(Category category) {
    this.category = category;
    return this;
  }

  Cost build() {
    return Cost(
        id: id,
        title: title,
        amount: amount,
        point: point,
        category: category,
        registeredAt: registeredAt);
  }
}
