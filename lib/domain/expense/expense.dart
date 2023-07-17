import 'package:flutter_template/domain/expense/category.dart';
import 'package:flutter_template/domain/expense/point.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense.freezed.dart';

@freezed
class Expense with _$Expense {
  const factory Expense({
    required String id,
    required String title,
    required double amount,
    required Point point,
    required Category category,
    required DateTime date,
  }) = _Expense;

  factory Expense.of({
    required String id,
    required String title,
    required double amount,
    required Point point,
    required Category category,
    required DateTime date,
  }) {
    return Expense(
      id: id,
      title: title,
      amount: amount,
      point: point,
      category: category,
      date: date,
    );
  }
}
