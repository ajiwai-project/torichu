import 'package:clock/clock.dart';
import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/presentation/features/calendar/calendar_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../domain/cost/model_support.dart';
import 'calendar_view_model_test.mocks.dart';

@GenerateMocks([CostRepository])
void main() {
  late CalendarViewModel sut;
  late MockCostRepository mockCostRepository;

  setUp(() {
    mockCostRepository = MockCostRepository();
    sut = CalendarViewModel(mockCostRepository);
  });

  group('Load', () {
    test('should get costs form cost repository', () async {
      final cost = CostBuilder().build();
      when(mockCostRepository.getAll())
          .thenAnswer((_) async => Costs(values: [cost]));

      await sut.load();

      verify(mockCostRepository.getAll()).called(1);
    });

    test('should set costs for each day', () async {
      final cost1 =
          CostBuilder().setRegisteredAt(DateTime(2023, 10, 10)).build();
      final cost2 =
          CostBuilder().setRegisteredAt(DateTime(2023, 10, 10)).build();
      final cost3 =
          CostBuilder().setRegisteredAt(DateTime(2023, 10, 11)).build();
      final costs = Costs(values: [cost1, cost2, cost3]);

      when(mockCostRepository.getAll()).thenAnswer((_) async => costs);

      await sut.load();

      expect(sut.debugState.value!.costsByDateTime, costs.costsGroupByDate);
    });

    test('should set focused day to starting of today', () async {
      var today = DateTime(2023, 10, 10, 10);
      withClock(Clock.fixed(today), () async {
        when(mockCostRepository.getAll())
            .thenAnswer((_) async => const Costs(values: []));

        await sut.load();

        expect(sut.debugState.value!.focusedDay, DateTime.utc(2023, 10, 10));
      });
    });
  });
}
