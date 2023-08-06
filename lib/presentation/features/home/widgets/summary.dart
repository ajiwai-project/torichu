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
    final showIndex = useState<List<bool>>([true, false]);
    var handleTab = useCallback((int index) {
      showIndex.value = [index == 0, index == 1];
    }, []);

    var toExpenseGraphData = useCallback(() {
      var sumOfPoint = costs.sumOfAmount;
      return costs.amountGroupByCategory.entries
          .map((e) => PieChartSectionData(
              showTitle: false,
              value: e.value / sumOfPoint,
              color: e.key.color))
          .toList();
    }, [costs]);

    var toPointGraphData = useCallback(() {
      var sumOfPoint = costs.sumOfPoint;
      return costs.pointGroupByCategory.entries
          .map((e) => PieChartSectionData(
              showTitle: false,
              value: e.value / sumOfPoint,
              color: e.key.color))
          .toList();
    }, [costs]);

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: showIndex.value[0]
              ? _Chart(
                  data: toPointGraphData(),
                  centerText: costs.sumOfPoint.toString())
              : _Chart(
                  data: toExpenseGraphData(),
                  centerText:
                      '￥${NumberFormat("#,###").format(costs.sumOfAmount)}')),
      Container(
        margin: const EdgeInsets.only(top: 10),
        child: ToggleButtons(
          borderRadius: BorderRadius.circular(10),
          constraints: const BoxConstraints(
            minHeight: 30.0,
            minWidth: 100.0,
          ),
          isSelected: showIndex.value,
          onPressed: (index) => {handleTab(index)},
          children: const <Widget>[Text("Point"), Text("Total Amount")],
        ),
      )
    ]);
  }
}

class _Chart extends StatelessWidget {
  final List<PieChartSectionData> data;
  final String centerText;

  const _Chart({Key? key, required this.data, required this.centerText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PieChart(PieChartData(sections: data, centerSpaceRadius: 100)),
        Center(
          child: Text(centerText,
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary)),
        )
      ],
    );
  }
}
