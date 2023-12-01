import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/presentation/features/calendar/widgets/saying/saying_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SayingWidget extends HookConsumerWidget {
  const SayingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sayingViewModelProvider);
    final viewModel = ref.watch(sayingViewModelProvider.notifier);

    useEffect(() {
      viewModel.load();
      return;
    }, const []);

    return state.when(
      data: (data) {
        return data.saying != null
            ? Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data.saying!.value,
                        style: const TextStyle(fontSize: 20)),
                    Text('- ${data.saying!.author}')
                  ],
                ))
            : const SizedBox();
      },
      loading: () {
        return const CircularProgressIndicator();
      },
      error: (err, stack) {
        return Text(err.toString());
      },
    );
  }
}
