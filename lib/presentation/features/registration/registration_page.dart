import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/domain/cost/category.dart';
import 'package:flutter_template/domain/cost/point.dart';
import 'package:flutter_template/domain/cost/tag.dart';
import 'package:flutter_template/presentation/features/home/home_page.dart';
import 'package:flutter_template/presentation/features/registration/registration_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegistrationPage extends HookConsumerWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registrationViewModelProvider);
    final viewModel = ref.watch(registrationViewModelProvider.notifier);

    var tagTextController = useTextEditingController();
    var handleEnterTag = useCallback((value) {
      viewModel.addTag(Tag.of(value));
      tagTextController.clear();
    }, []);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading:
              BackButton(color: Theme.of(context).colorScheme.onBackground),
        ),
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
                  DropdownButtonFormField<Category>(
                    key: const Key('category-field'),
                    value: state.category,
                    items: Category.values.map((value) {
                      return DropdownMenuItem<Category>(
                          value: value,
                          child: Text(value.value,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground)));
                    }).toList(),
                    onChanged: (Category? value) =>
                        viewModel.setCategory(value!),
                    decoration: const InputDecoration(
                        hintText: 'カテゴリを入力', labelText: 'カテゴリ'),
                  ),
                  TextField(
                      key: const Key('tags-field'),
                      controller: tagTextController,
                      decoration: const InputDecoration(
                          hintText: 'タグを入力', labelText: 'タグ'),
                      onSubmitted: handleEnterTag),
                  Container(
                      margin: const EdgeInsets.only(top: 16),
                      width: double.infinity,
                      child: Wrap(
                        spacing: 4.0,
                        children: state.tags.value
                            .map((e) => Chip(label: Text(e.value)))
                            .toList(),
                      ))
                ]),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                        key: const Key('register-button'),
                        onPressed: () => viewModel
                            .register()
                            .then((_) => _navigateToHome(context)),
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

  _navigateToHome(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const HomePage();
    }));
  }
}
