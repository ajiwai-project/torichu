import 'package:flutter_template/domain/expense/expense.dart';

abstract class ExpenseRepository {
  Future<List<Expense>> getExpenses();
}
