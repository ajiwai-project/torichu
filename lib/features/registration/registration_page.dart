import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/features/models/category.dart';
import 'package:flutter_template/features/models/cost.dart';
import 'package:flutter_template/features/models/point.dart';
import 'package:flutter_template/features/registration/registration_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegistrationPage extends HookConsumerWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registrationViewModelProvider);
    final viewModel = ref.watch(registrationViewModelProvider.notifier);

    return Scaffold(
        appBar: AppBar(title: const Text('入力')),
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
                    onChanged: (value) => viewModel.setTitle(value),
                  ),
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
                          value: value, child: Text(value.value.toString()));
                    }).toList(),
                    onChanged: (Point? value) => viewModel.setPoint(value!),
                    decoration: const InputDecoration(
                        hintText: 'ポイントを入力', labelText: 'ポイント'),
                  ),
                  DropdownButtonFormField<Category>(
                    key: const Key('category-field'),
                    value: state.category,
                    items: Category.values.map((value) {
                      return DropdownMenuItem<Category>(
                          value: value, child: Text(value.value));
                    }).toList(),
                    onChanged: (Category? value) => viewModel.setCategory(value!),
                    decoration: const InputDecoration(
                        hintText: 'カテゴリを入力', labelText: 'カテゴリ'),
                  )
                ]),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        key: const Key('register-button'),
                        onPressed: () {
                          if (state.point == null || state.category == null) {
                            return;
                          }
                          viewModel.register(Cost(
                              title: state.title,
                              amount: state.price,
                              point: state.point!,
                              category: state.category!));
                        },
                        child: const Text('確定')))
              ],
            )));
  }
}
