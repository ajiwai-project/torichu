import 'package:flutter_template/features/models/category.dart';
import 'package:flutter_template/features/models/point.dart';

class Cost {
  static const _maxTitleLength = 100;
  static const _maxAmount = 9999999;

  late String _title;
  late int _amount;
  late Point _point;
  late Category _category;

  Cost(
      {required String title,
      required int amount,
      required Point point,
      required Category category}) {
    if (title.length > _maxTitleLength) {
      throw Exception('Title must be 100 characters or less.');
    }

    if (amount > _maxAmount) {
      throw Exception('Amount must be less than 9999999');
    }

    _title = title;
    _amount = amount;
    _point = point;
    _category = category;
  }

  String get title => _title;
  int get amount => _amount;
  Point get point => _point;
  Category get category => _category;
}
