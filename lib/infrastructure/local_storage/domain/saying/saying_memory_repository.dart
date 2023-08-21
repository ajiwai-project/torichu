import 'dart:math';

import 'package:flutter_template/domain/saying/saying.dart';
import 'package:flutter_template/domain/saying/saying_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sayingRepositoryProvider =
    Provider<SayingRepository>((_) => SayingMemoryRepository());

class SayingMemoryRepository implements SayingRepository {
  final List<Saying> sayings = [
    const Saying(
        value: 'Luck is where preparation meets opportunity.',
        author: 'Randy Pausch'),
    const Saying(
        value: 'A penny saved is a penny earned.', author: 'Benjamin Franklin'),
    const Saying(
        value: 'An investment in knowledge pays the best interest.',
        author: 'Benjamin Franklin'),
    const Saying(
        value: 'Do what you love and the money will follow.',
        author: 'Marsha Sinetar'),
    const Saying(
        value:
            'If you cannot control your emotions, you cannot control your money.',
        author: 'Warren Edward Buffett')
  ];
  SayingMemoryRepository();

  @override
  Future<Saying> choice() {
    var random = Random();
    return Future.value(sayings[random.nextInt(sayings.length)]);
  }
}
