import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:intl/intl.dart';

class Summary extends HookWidget {
  final Costs costs;

  const Summary({Key? key, required this.costs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tabIndex = useState<int>(0);
    var handleTab = useCallback((int index) {
      tabIndex.value = index;
    }, []);

    var toExpenseGraphData = useCallback(() {
      var sumOfPoint = costs.sumOfAmount;
      return costs.amountGroupByCategory.entries
          .map((e) => PieChartSectionData(
              title: '',
              value: e.value / sumOfPoint,
              color: e.key.color))
          .toList();
    }, [costs]);

    var toPointGraphData = useCallback(() {
      var sumOfPoint = costs.sumOfPoint;
      return costs.pointGroupByCategory.entries
          .map((e) => PieChartSectionData(
              title: '',
              value: e.value / sumOfPoint,
              color: e.key.color))
          .toList();
    }, [costs]);

    return DefaultTabController(
        length: 2,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: tabIndex.value == 0
                  ? _Chart(data: toPointGraphData())
                  : _Chart(data: toExpenseGraphData())),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: [
                GestureDetector(
                    onTap: () => handleTab(0),
                    child: Text(
                      costs.sumOfPoint.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: tabIndex.value == 0 ? 40 : 24,
                          color: tabIndex.value == 0
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onBackground),
                    )),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: const Text('/', style: TextStyle(fontSize: 28))),
                GestureDetector(
                    onTap: () => handleTab(1),
                    child: Text(
                      '￥${NumberFormat("#,###").format(costs.sumOfAmount)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: tabIndex.value == 1 ? 40 : 24,
                          color: tabIndex.value == 1
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onBackground),
                    ))
              ]))
        ]));
  }
}

class _Chart extends StatelessWidget {
  final List<PieChartSectionData> data;

  const _Chart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(PieChartData(sections: data, centerSpaceRadius: 48));
  }
}
