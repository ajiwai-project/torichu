import 'package:flutter_template/domain/expense/expense.dart';
import 'package:flutter_template/domain/expense/expense_repository.dart';
import 'package:flutter_template/infrastructure/local_storage/domain/expense/expense_entity.dart';
import 'package:hive/hive.dart';

class ExpenseRepositoryLsImpl implements ExpenseRepository {
  Box<ExpenseEntity> box;

  ExpenseRepositoryLsImpl(this.box);

  @override
  Future<List<Expense>> getExpenses() {
    return Future.value(box.values.map((e) => e.toDomain()).toList());
  }
}
