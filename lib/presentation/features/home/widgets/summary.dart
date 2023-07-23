import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:intl/intl.dart';

class Summary extends StatelessWidget {
  final Costs costs;

  const Summary({Key? key, required this.costs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sampleData = [
      PieChartSectionData(value: 10, color: Colors.purple),
      PieChartSectionData(value: 20, color: Colors.amber),
      PieChartSectionData(value: 30, color: Colors.green)
    ];

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: _Chart(data: sampleData)),
      Expanded(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _SumItem(label: '支出', value: costs.sumOfAmount, isPrice: true),
          _SumItem(label: 'ポイント', value: costs.sumOfPoint),
        ],
      ))
    ]);
  }
}

class _Chart extends StatelessWidget {
  final List<PieChartSectionData> data;

  const _Chart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        child: PieChart(PieChartData(sections: data)));
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
