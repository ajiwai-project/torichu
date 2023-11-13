import 'package:flutter/material.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/size.dart';
import 'package:intl/intl.dart';

class CostListItem extends StatelessWidget {
  final Cost cost;
  final Function(DismissDirection) onDismissed;
  const CostListItem({Key? key, required this.cost, required this.onDismissed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('MMMEd').format(cost.registeredAt);
    final screenWidth = MediaQuery.of(context).size.width;
    final platform = Theme.of(context).platform;
    return Dismissible(
        key: UniqueKey(),
        onDismissed: onDismissed,
        direction: platform == TargetPlatform.iOS
            ? DismissDirection.endToStart
            : DismissDirection.startToEnd,
        background: Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            color: Colors.redAccent,
            child: const Icon(Icons.delete, color: Colors.white)),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          title: Text(cost.title.value,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: screenWidth * 0.5,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(formattedDate),
                        ])),
                Text('￥${NumberFormat("#,###").format(cost.amount.value)}',
                    style: const TextStyle(fontSize: 16)),
              ]),
          leading: Container(
              alignment: Alignment.center,
              height: screenWidth * 0.12,
              width: screenWidth * 0.12,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Theme.of(context).colorScheme.primary, width: 3)),
              child: Text(
                cost.size.symbol(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
        ));
  }
}
