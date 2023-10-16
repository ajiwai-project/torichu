import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/presentation/features/calendar/calendar_view_model.dart';
import 'package:flutter_template/presentation/features/registration/registration_page.dart';
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
            data: (data) => CalendarWidget(data.pointByDateTime),
            error: (e, msg) => const Text('Error'),
            loading: () => const SafeArea(
                child: Center(
                    child: CircularProgressIndicator(color: Colors.red)))),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationPage()))
                .then((value) => viewModel.load());
          },
        ));
  }
}

class CalendarWidget extends StatelessWidget {
  final Map<DateTime, int> pointByDateTime;

  const CalendarWidget(this.pointByDateTime, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TableCalendar(
            firstDay: DateTime(2023, 1, 1),
            lastDay: DateTime(2023, 12, 31),
            focusedDay: DateTime.now(),
            daysOfWeekHeight: 32,
            locale: 'ja_JP',
            calendarBuilders:
                CalendarBuilders(defaultBuilder: (context, day, focusedDay) {
              final text = day.day.toString();
              return Container(
                  padding: const EdgeInsets.all(2),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.white12)),
                  child: Text(text));
            }, markerBuilder: (context, day, events) {
              final point = pointByDateTime[day];
              return Container(
                  alignment: Alignment.center,
                  child: Text(point?.toString() ?? '',
                      style: const TextStyle(fontSize: 20)));
            }, dowBuilder: (context, day) {
              final daysOfWeek = DateFormat.E().format(day);
              return Container(
                  alignment: Alignment.center, child: Text(daysOfWeek));
            })));
  }
}
