import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/domain/cost/size.dart';
import 'package:flutter_template/presentation/features/registration/registration_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegistrationPage extends HookConsumerWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registrationViewModelProvider);
    final viewModel = ref.watch(registrationViewModelProvider.notifier);

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
                  DropdownButtonFormField<Size>(
                    key: const Key('size-field'),
                    value: state.size,
                    items: Size.values.map((value) {
                      return DropdownMenuItem<Size>(
                          value: value,
                          child: Text(value.upperCase(),
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground)));
                    }).toList(),
                    onChanged: (Size? value) => viewModel.setSize(value!),
                    decoration: const InputDecoration(
                        hintText: 'サイズを選択', labelText: 'サイズ'),
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
