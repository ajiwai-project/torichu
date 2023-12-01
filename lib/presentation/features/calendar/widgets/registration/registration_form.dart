import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/domain/cost/size.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'registration_view_model.dart';

class RegistrationForm extends HookConsumerWidget {
  final Function? onSuccess;
  const RegistrationForm({super.key, this.onSuccess});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registrationViewModelProvider);
    final viewModel = ref.watch(registrationViewModelProvider.notifier);

    void handleOnSuccess() {
      if (onSuccess != null) {
        onSuccess!();
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Added to list'),
            duration: Duration(seconds: 2),
            margin: EdgeInsets.only(left: 23, right: 23, bottom: 23),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
      );
    }

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
                    () => viewModel.register().then((_) => handleOnSuccess())),
              ],
            )));
  }
}

class _TitleField extends StatelessWidget {
  final Function(String) onChanged;

  const _TitleField(this.onChanged);

  @override
  Widget build(BuildContext context) {
    return TextField(
        key: const Key('title-field'),
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'タイトルを入力',
            labelText: 'タイトル'),
        onChanged: onChanged);
  }
}

class _PriceField extends StatelessWidget {
  final Function(int) onChanged;

  const _PriceField(this.onChanged);

  @override
  Widget build(BuildContext context) {
    return TextField(
        key: const Key('price-field'),
        decoration: const InputDecoration(
            border: OutlineInputBorder(), hintText: '金額を入力', labelText: '金額'),
        keyboardType: Platform.isIOS
            ? const TextInputType.numberWithOptions(signed: true)
            : TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) => onChanged(int.parse(value)));
  }
}

class _SizeSelector extends StatelessWidget {
  final Size? size;
  final Function(Size) onChanged;

  const _SizeSelector(this.size, this.onChanged);

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
          border: OutlineInputBorder(), hintText: 'サイズを選択', labelText: 'サイズ'),
    );
  }
}

class _RegistrationButton extends StatelessWidget {
  final Function onPressed;

  const _RegistrationButton(this.onPressed);

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
