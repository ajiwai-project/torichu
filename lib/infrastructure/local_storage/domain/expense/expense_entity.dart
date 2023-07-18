import 'package:flutter_template/domain/expense/category.dart';
import 'package:flutter_template/domain/expense/expense.dart';
import 'package:flutter_template/domain/expense/point.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'expense_entity.g.dart';

@HiveType(typeId: 0)
class ExpenseEntity extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  double amount;

  @HiveField(3)
  int point;

  @HiveField(4)
  String category;

  @HiveField(5)
  DateTime date;

  ExpenseEntity({
    required this.id,
    required this.title,
    required this.amount,
    required this.point,
    required this.category,
    required this.date,
  });

  Expense toDomain() {
    return Expense(
      id: id,
      title: title,
      amount: amount,
      point: Point.of(point),
      category: Category.of(category),
      date: date,
    );
  }

  @override
  String toString() {
    return 'ExpenseEntity{id: $id, title: $title, amount: $amount, point: $point, category: $category, date: $date}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenseEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          amount == other.amount &&
          point == other.point &&
          category == other.category &&
          date == other.date;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      amount.hashCode ^
      point.hashCode ^
      category.hashCode ^
      date.hashCode;
}
