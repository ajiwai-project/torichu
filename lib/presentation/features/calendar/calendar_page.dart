import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/constants.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/presentation/features/calendar/calendar_view_model.dart';
import 'package:flutter_template/presentation/features/cost_list_viewer/widgets/cost_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends HookConsumerWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(calendarViewModelProvider);
    final viewModel = ref.watch(calendarViewModelProvider.notifier);

    useEffect(() {
      viewModel.load();
      return;
    }, const []);

    return Scaffold(
        body: state.when(
            data: (data) => CalendarWidget(
                data.costsByDateTime, data.focusedDay, viewModel.remove),
            error: (e, msg) => const Text('Error'),
            loading: () => const SafeArea(
                child: Center(
                    child: CircularProgressIndicator(color: Colors.red)))));
  }
}

class CalendarWidget extends StatelessWidget {
  final Map<DateTime, Costs> costsByDateTime;
  final DateTime focusedDay;
  final Function onListItemDismissed;

  const CalendarWidget(
      this.costsByDateTime, this.focusedDay, this.onListItemDismissed,
      {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: 日付をタップでcostの表示を切り替えられる
    // TODO: 選択されている日付がわかること
    // TODO: 今日がわかること

    final dateFormat = DateFormat('yyyyMMdd');
    return Center(
        child: Column(
      children: [
        TableCalendar(
            firstDay: DateTime.parse(ReleaseDate.stringValue),
            lastDay: clock.now(),
            focusedDay: clock.now(),
            daysOfWeekHeight: 32,
            calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) => DayWidget(day),
                todayBuilder: (context, day, focusedDay) => DayWidget(day),
                outsideBuilder: (context, day, focusedDay) => DayWidget(day),
                disabledBuilder: (context, day, focusedDay) => DayWidget(day),
                markerBuilder: (context, day, events) {
                  final costs = costsByDateTime[day];
                  return Container(
                      key: Key('${dateFormat.format(day)}-point'),
                      alignment: Alignment.center,
                      child: Text(costs?.sumOfPoint.toString() ?? '',
                          style: const TextStyle(fontSize: 20)));
                },
                dowBuilder: (context, day) {
                  final daysOfWeek = DateFormat.E().format(day);
                  return Container(
                      alignment: Alignment.center, child: Text(daysOfWeek));
                })),
        Expanded(
            child: CostList(
                costsByDateTime[focusedDay]?.values ?? [], onListItemDismissed))
      ],
    ));
  }
}

class DayWidget extends StatelessWidget {
  final DateTime day;

  const DayWidget(this.day, {super.key});

  @override
  Widget build(BuildContext context) {
    final text = day.day.toString();
    return Container(
        padding: const EdgeInsets.all(2),
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.white12)),
        child: Text(text));
  }
}
