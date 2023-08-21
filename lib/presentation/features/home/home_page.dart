import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/domain/saying/saying.dart';
import 'package:flutter_template/presentation/features/home/widgets/cost_list.dart';
import 'package:flutter_template/presentation/features/home/home_view_model.dart';
import 'package:flutter_template/presentation/features/home/widgets/summary.dart';
import 'package:flutter_template/presentation/features/registration/registration_page.dart';
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
          data: (data) => data.costs.isEmpty
              ? SayingWidget(data.saying)
              : CostsWidget(data.costs, viewModel.remove),
          error: (e, msg) => const Text('Error'),
          loading: () => const Scaffold(
              body: SafeArea(
                  child: Center(
                      child: CircularProgressIndicator(color: Colors.red))))),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistrationPage()))
              .then((value) => viewModel.load());
        },
      ),
    );
  }
}

class CostsWidget extends StatelessWidget {
  final Costs costs;
  final Function onListItemDismissed;

  const CostsWidget(this.costs, this.onListItemDismissed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(child: Summary(costs: costs)),
      Expanded(child: CostList(costs.values, onListItemDismissed))
    ]);
  }
}

class SayingWidget extends StatelessWidget {
  final Saying value;

  const SayingWidget(this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(20.0),
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(value.value, style: const TextStyle(fontSize: 20)),
        Text('- ${value.author}')
      ],
    ));
  }
}
