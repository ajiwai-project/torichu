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
    var formattedDate = cost.datetime == null ? '' : DateFormat('M月d日').format(cost.datetime!);
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
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(cost.title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(cost.point.value.toString())
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CategoryIcon(category: cost.category),
                      Text('￥${NumberFormat("#,###").format(cost.amount)}')
                    ]),
                Text(formattedDate)
              ],
            )));
  }
}
