import 'package:flutter/material.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/presentation/features/home/widgets/category_icon.dart';
import 'package:intl/intl.dart';

class CostListItem extends StatelessWidget {
  final Cost cost;
  final Function(DismissDirection) onDismissed;
  const CostListItem({Key? key, required this.cost, required this.onDismissed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formattedDate = DateFormat('M月d日').format(cost.registeredAt);
    return Dismissible(
        key: UniqueKey(),
        onDismissed: onDismissed,
        direction: DismissDirection.startToEnd,
        background: Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            color: Colors.redAccent,
            child: const Icon(Icons.delete, color: Colors.white)),
        child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
            title: Text(cost.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(formattedDate),
                  CategoryIcon(category: cost.category),
                  Text('￥${NumberFormat("#,###").format(cost.amount)}'),
                ]),
            leading: Container(
                alignment: Alignment.center,
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 3)),
                child: Text(
                  cost.point.value.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ))));
  }
}
