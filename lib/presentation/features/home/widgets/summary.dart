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
              title: e.key.value,
              value: e.value / sumOfPoint,
              color: e.key.color,
              titleStyle: const TextStyle(color: Colors.white, fontSize: 12)))
          .toList();
    }, [costs]);

    var toPointGraphData = useCallback(() {
      var sumOfPoint = costs.sumOfPoint;
      return costs.pointGroupByCategory.entries
          .map((e) => PieChartSectionData(
              title: e.key.value,
              value: e.value / sumOfPoint,
              color: e.key.color,
              titleStyle: const TextStyle(color: Colors.white, fontSize: 12)))
          .toList();
    }, [costs]);

    return DefaultTabController(
        length: 2,
        child: Column(children: [
          Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: const EdgeInsets.symmetric(vertical: 8),
              height: 40,
              child: TabBar(
                  labelStyle: const TextStyle(fontSize: 12),
                  unselectedLabelColor: Colors.black12,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey),
                  tabs: const [_Tab(label: 'ポイント'), _Tab(label: '支出')],
                  onTap: handleTab)),
          Expanded(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
                child: tabIndex.value == 0
                    ? _Chart(data: toExpenseGraphData())
                    : _Chart(data: toPointGraphData())),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _SumItem(
                          label: '支出', value: costs.sumOfAmount, isPrice: true),
                      _SumItem(label: 'ポイント', value: costs.sumOfPoint),
                    ]))
          ]))
        ]));
  }
}

class _Tab extends StatelessWidget {
  final String label;

  const _Tab({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(child: Align(alignment: Alignment.center, child: Text(label)));
  }
}

class _Chart extends StatelessWidget {
  final List<PieChartSectionData> data;

  const _Chart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        child: PieChart(PieChartData(sections: data, centerSpaceRadius: 48)));
  }
}

class _SumItem extends StatelessWidget {
  final String label;
  final int value;
  final bool isPrice;

  const _SumItem(
      {Key? key,
      required this.label,
      required this.value,
      this.isPrice = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: isPrice
            ? Text('￥${NumberFormat("#,###").format(value)}')
            : Text('$value'));
  }
}
