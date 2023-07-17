import 'package:flutter/material.dart';
import 'package:flutter_template/domain/expense/expense.dart';
import 'package:flutter_template/features/home/widgets/category_icon.dart';
import 'package:intl/intl.dart';

class ExpenseListItem extends StatelessWidget {
  final Expense expense;
  const ExpenseListItem({Key? key, required this.expense}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        title: Text(expense.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CategoryIcon(category: expense.category),
          Text('￥${NumberFormat("#,###").format(expense.amount)}'),
          Text(DateFormat('dd/MM/yyyy').format(expense.date)),
        ]),
        trailing: Text(
            expense.point.value.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
    );
  }
}
