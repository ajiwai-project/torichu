import 'package:flutter_template/domain/cost/category.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/point.dart';

class CostBuilder {
  String title = 'dummy';
  int amount = -1;
  Point point = Point.one;
  Category category = Category.food;

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
    return Cost(title: title, amount: amount, point: point, category: category);
  }
}
