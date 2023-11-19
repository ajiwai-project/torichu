import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/domain/cost/size.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'registration_view_model.dart';

class RegistrationForm extends HookConsumerWidget {
  final Function? onSuccess;
  const RegistrationForm({Key? key, this.onSuccess}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registrationViewModelProvider);
    final viewModel = ref.watch(registrationViewModelProvider.notifier);

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  _TitleField((value) => viewModel.setTitle(value)),
                  const SizedBox(height: 16),
                  _PriceField((value) => viewModel.setPrice(value)),
                  const SizedBox(height: 16),
                  _SizeSelector(
                      state.size, (value) => viewModel.setSize(value)),
                ]),
                _RegistrationButton(
                    () => viewModel.register().then((_) => onSuccess != null ? onSuccess!() : null)),
              ],
            )));
  }
}

class _TitleField extends StatelessWidget {
  final Function(String) onChanged;

  const _TitleField(this.onChanged, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        key: const Key('title-field'),
        decoration:

            const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'タイトルを入力', labelText: 'タイトル'),
        onChanged: onChanged);
  }
}

class _PriceField extends StatelessWidget {
  final Function(int) onChanged;

  const _PriceField(this.onChanged, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        key: const Key('price-field'),
        decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: '金額を入力', labelText: '金額'),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) => onChanged(int.parse(value)));
  }
}

class _SizeSelector extends StatelessWidget {
  final Size? size;
  final Function(Size) onChanged;

  const _SizeSelector(this.size, this.onChanged, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Size>(
      key: const Key('size-field'),
      value: size,
      items: Size.values.map((value) {
        return DropdownMenuItem<Size>(
            value: value,
            child: Text(value.upperCase(),
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground)));
      }).toList(),
      onChanged: (Size? value) => onChanged(value!),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'サイズを選択', labelText: 'サイズ'),
    );
  }
}

class _RegistrationButton extends StatelessWidget {
  final Function onPressed;

  const _RegistrationButton(this.onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
        key: const Key('register-button'),
        onPressed: () => onPressed(),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          foregroundColor: Theme.of(context).colorScheme.onBackground,
        ),
        icon: const Icon(Icons.add),
        label: const Text('Add to list'));
  }
}
