import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/presentation/features/home/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../domain/cost/model_support.dart';
import 'home_view_model_test.mocks.dart';

@GenerateMocks([CostRepository])
void main() {
  late HomeViewModel sut;
  late CostRepository costRepository;

  setUp(() {
    costRepository = MockCostRepository();
    sut = HomeViewModel(costRepository);
  });

  group('Load', () {
    test('should store costs form cost repository', () async {
      final cost = CostBuilder().build();
      when(costRepository.getAll())
          .thenAnswer((_) async => Costs(values: [cost]));

      await sut.load();

      verify(costRepository.getAll()).called(1);
      expect(sut.debugState.value!.costs, Costs(values: [cost]));
    });

    test('should sort costs by registered at in descending order', () async {
      var cost1 =
          CostBuilder().setRegisteredAt(DateTime(2023, 8, 4, 10)).build();
      var cost2 =
          CostBuilder().setRegisteredAt(DateTime(2023, 8, 4, 13)).build();
      var cost3 =
          CostBuilder().setRegisteredAt(DateTime(2023, 8, 4, 12)).build();

      when(costRepository.getAll())
          .thenAnswer((_) async => Costs(values: [cost1, cost2, cost3]));

      await sut.load();

      expect(sut.debugState.value!.costs, Costs(values: [cost2, cost3, cost1]));
    });
  });

  group('Remove', () {
    test('should remove from state by using cost repository', () async {
      const costId = 'id1';
      when(costRepository.getAll())
          .thenAnswer((_) async => const Costs(values: []));

      await sut.remove(costId);

      verify(costRepository.remove(costId)).called(1);
      verify(costRepository.getAll()).called(1);
    });
  });
}
