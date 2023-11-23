import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/constants.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/presentation/widgets/cost_list/cost_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:table_calendar/table_calendar.dart';

import 'calendar_view_model.dart';
import './widgets/registration/registration_form.dart';

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
                data.costsByDateTime,
                data.focusedDay,
                viewModel.remove,
                viewModel.setFocusedDay,
                viewModel.load),
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
  final Function onDaySelected;
  final Function onRegistred;

  const CalendarWidget(this.costsByDateTime, this.focusedDay,
      this.onListItemDismissed, this.onDaySelected, this.onRegistred,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('yyyyMMdd');
    return SlidingUpPanel(
      body: Center(
          child: Column(
        children: [
          TableCalendar(
              firstDay: DateTime.parse(ReleaseDate.stringValue),
              lastDay: clock.now(),
              focusedDay: focusedDay,
              daysOfWeekHeight: 32,
              headerStyle: const HeaderStyle(formatButtonVisible: false),
              calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) =>
                      DayWidget(day, focused: isSameDay(day, focusedDay)),
                  todayBuilder: (context, day, focusedDay) =>
                      DayWidget(day, focused: isSameDay(day, focusedDay)),
                  outsideBuilder: (context, day, focusedDay) => DayWidget(day),
                  disabledBuilder: (context, day, focusedDay) => DayWidget(day),
                  markerBuilder: (context, day, events) {
                    final costs = costsByDateTime[day];
                    return Container(
                        key: Key('${dateFormat.format(day)}-size'),
                        alignment: Alignment.bottomCenter,
                        child: Text(costs?.sumOfSize.toString() ?? '',
                            style: const TextStyle(fontSize: 20)));
                  },
                  dowBuilder: (context, day) {
                    final daysOfWeek = DateFormat.E().format(day);
                    return Container(
                        alignment: Alignment.center, child: Text(daysOfWeek));
                  }),
              onDaySelected: (selectedDay, focusedDay) =>
                  onDaySelected(selectedDay)),
          Expanded(
              child: CostList(costsByDateTime[focusedDay]?.values ?? [],
                  onListItemDismissed))
        ],
      )),
      panel: RegistrationForm(onSuccess: onRegistred),
      collapsed:
          const Center(child: Icon(Icons.expand_less, key: Key('collapsed'))),
      color: Colors.red,
      minHeight: 30,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
    );
  }
}

class DayWidget extends StatelessWidget {
  final DateTime day;
  final bool focused;

  const DayWidget(this.day, {this.focused = false, super.key});

  @override
  Widget build(BuildContext context) {
    final text = day.day.toString();
    return Container(
        padding: const EdgeInsets.all(2),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.white12)),
        child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: focused ? Colors.blue : Colors.transparent,
            ),
            child: Text(text)));
  }
}
