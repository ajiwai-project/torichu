import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/constants.dart';
import 'package:flutter_template/domain/cost/point.dart';
import 'package:flutter_template/presentation/features/registration/registration_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class RegistrationPage extends HookConsumerWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registrationViewModelProvider);
    final viewModel = ref.watch(registrationViewModelProvider.notifier);

    final dateTextController = useTextEditingController(
        text: DateFormat('yyyy/MM/dd').format(state.registeredAt));

    final handleSelectRegisteredAt = useCallback(() async {
      final registeredAt = await showDatePicker(
          context: context,
          initialDate: state.registeredAt,
          firstDate: DateTime.parse(ReleaseDate.stringValue),
          lastDate: clock.now());
      if (registeredAt != null) {
        dateTextController.text = DateFormat('yyyy/MM/dd').format(registeredAt);
        viewModel.setRegisteredAt(registeredAt);
      }
    }, [viewModel, context, dateTextController, state.registeredAt]);

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  TextField(
                      key: const Key('title-field'),
                      decoration: const InputDecoration(
                          hintText: 'タイトルを入力', labelText: 'タイトル'),
                      onChanged: (value) => viewModel.setTitle(value)),
                  TextField(
                    key: const Key('price-field'),
                    decoration: const InputDecoration(
                        hintText: '金額を入力', labelText: '金額'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) => viewModel.setPrice(int.parse(value)),
                  ),
                  DropdownButtonFormField<Point>(
                    key: const Key('point-field'),
                    value: state.point,
                    items: Point.values.map((value) {
                      return DropdownMenuItem<Point>(
                          value: value,
                          child: Text(value.value.toString(),
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground)));
                    }).toList(),
                    onChanged: (Point? value) => viewModel.setPoint(value!),
                    decoration: const InputDecoration(
                        hintText: 'ポイントを入力', labelText: 'ポイント'),
                  ),
                  TextField(
                    key: const Key('registered-at-field'),
                    controller: dateTextController,
                    decoration: const InputDecoration(
                        hintText: '日付を入力', labelText: '日付'),
                    onTap: handleSelectRegisteredAt,
                  ),
                ]),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                        key: const Key('register-button'),
                        onPressed: () => viewModel.register(),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                          foregroundColor:
                              Theme.of(context).colorScheme.onBackground,
                        ),
                        icon: const Icon(Icons.add),
                        label: const Text('Add to list')))
              ],
            )));
  }
}
