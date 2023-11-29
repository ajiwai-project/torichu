import 'package:flutter/material.dart';
import 'package:flutter_template/domain/saying/saying.dart';
import 'package:flutter_template/domain/saying/saying_repository.dart';
import 'package:flutter_template/infrastructure/local_storage/domain/saying/saying_memory_repository.dart';
import 'package:flutter_template/presentation/features/calendar/widgets/saying/saying_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'saying_view_test.mocks.dart';

@GenerateMocks([SayingRepository])
void main() {
  late SayingRepository mockSayingRepository;

  setUp(() {
    mockSayingRepository = MockSayingRepository();
  });

  testWidgets('should show saying', (tester) async {
    when(mockSayingRepository.choice())
        .thenAnswer((_) async => const Saying(value: 'saying', author: 'hoge'));

    await tester.pumpWidget(ProviderScope(overrides: [
      sayingRepositoryProvider.overrideWith(((ref) => mockSayingRepository)),
    ], child: const MaterialApp(home: SayingWidget())));
    await tester.pumpAndSettle();

    expect(find.text('saying'), findsOneWidget);
    expect(find.text('- hoge'), findsOneWidget);
    verify(mockSayingRepository.choice()).called(1);
  });
}
