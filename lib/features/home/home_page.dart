import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/features/home/widgets/expense_list_item.dart';
import 'package:flutter_template/features/home/home_view_model.dart';
import 'package:flutter_template/features/task_edit/task_edit_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);
    final viewModel = ref.watch(homeViewModelProvider.notifier);

    useEffect(() {
      viewModel.load();
      return;
    }, const []);

    return Scaffold(
      body: state.when(
          data: (data) {
            return ListView.builder(
                itemCount: data.expenses.length,
                itemBuilder: (context, index) {
                  var expense = data.expenses[index];
                  return ExpenseListItem(expense: expense);
                });
          },
          error: (e, msg) => const Text('Error'),
          loading: () => const Scaffold(
              body: SafeArea(
                  child: Center(
                      child: CircularProgressIndicator(color: Colors.red))))),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TaskEditPage()))
              .then((value) => viewModel.load());
        },
      ),
    );
  }
}
