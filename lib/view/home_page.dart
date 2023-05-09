import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/viewmodel/home_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);
    final viewModel = ref.watch(homeViewModelProvider.notifier);

    useEffect(() {
      viewModel.load();
    }, const []);

    return Scaffold(
        appBar: AppBar(title: const Text('Todo list')),
        body: state.when(
            data: (data) => const Text('loaded'),
            error: (e, msg) => const Text('Error'),
            loading: () => const Scaffold(
                body: SafeArea(
                    child: Center(
                        child:
                            CircularProgressIndicator(color: Colors.red))))));
  }
}
