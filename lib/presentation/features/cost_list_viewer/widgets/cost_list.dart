import 'package:flutter/material.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/presentation/features/cost_list_viewer/widgets/cost_list_item.dart';

class CostList extends StatelessWidget {
  final List<Cost> costs;
  final Function deleteCost;

  const CostList(this.costs, this.deleteCost, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: costs.length,
        itemBuilder: (context, index) {
          var cost = costs[index];
          return CostListItem(
            cost: cost,
            onDismissed: (_) {
              deleteCost(cost.id);
            },
          );
        });
  }
}
