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
    final viewModel = ref.watch(registrationViewModelProvider.notifier);

    var title = useState<String>('');
    var titleController = useTextEditingController();

    var price = useState<int>(0);
    var priceController = useTextEditingController();

    var point = useState<Point?>(null);
    var points = Point.values;

    var category = useState<Category?>(null);
    var categories = Category.values;

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
                    controller: titleController,
                    decoration: const InputDecoration(
                        hintText: 'タイトルを入力', labelText: 'タイトル'),
                    onChanged: (value) {
                      title.value = value;
                    },
                  ),
                  TextField(
                    key: const Key('price-field'),
                    controller: priceController,
                    decoration: const InputDecoration(
                        hintText: '金額を入力', labelText: '金額'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) {
                      price.value = int.parse(value);
                    },
                  ),
                  DropdownButtonFormField<Point>(
                    key: const Key('point-field'),
                    value: point.value,
                    items: points.map((value) {
                      return DropdownMenuItem<Point>(
                          value: value, child: Text(value.value.toString()));
                    }).toList(),
                    onChanged: (Point? value) {
                      point.value = value;
                    },
                    decoration: const InputDecoration(
                        hintText: 'ポイントを入力', labelText: 'ポイント'),
                  ),
                  DropdownButtonFormField<Category>(
                    key: const Key('category-field'),
                    value: category.value,
                    items: categories.map((value) {
                      return DropdownMenuItem<Category>(
                          value: value, child: Text(value.value));
                    }).toList(),
                    onChanged: (Category? value) {
                      category.value = value;
                    },
                    decoration: const InputDecoration(
                        hintText: 'カテゴリを入力', labelText: 'カテゴリ'),
                  )
                ]),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        key: const Key('register-button'),
                        onPressed: () {
                          if (point.value == null || category.value == null) {
                            return;
                          }
                          viewModel.register(Cost(
                              title: title.value,
                              amount: price.value,
                              point: point.value!,
                              category: category.value!));
                        },
                        child: const Text('確定')))
              ],
            )));
  }
}
