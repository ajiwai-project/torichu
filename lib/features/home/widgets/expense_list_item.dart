import 'package:flutter/material.dart';
import 'package:flutter_template/features/home/widgets/category_icon.dart';
import 'package:flutter_template/features/models/cost.dart';
import 'package:intl/intl.dart';

class CostListItem extends StatelessWidget {
  final Cost cost;
  const CostListItem({Key? key, required this.cost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        title: Text(cost.title,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CategoryIcon(category: cost.category),
              Text('￥${NumberFormat("#,###").format(cost.amount)}'),
            ]),
        trailing: Text(
          cost.point.value.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ));
  }
}
