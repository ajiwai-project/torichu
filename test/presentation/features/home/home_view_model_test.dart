import 'package:flutter_template/domain/cost/category.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/domain/cost/point.dart';
import 'package:flutter_template/presentation/features/home/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_view_model_test.mocks.dart';

@GenerateMocks([CostRepository])
void main() {
  late HomeViewModel sut;
  late CostRepository costRepository;

  setUp(() {
    costRepository = MockCostRepository();
    sut = HomeViewModel(costRepository);
  });

  Cost costOf(String id, DateTime datetime) {
    return Cost(
        id: id,
        title: 'dummy',
        amount: 1,
        point: Point.one,
        category: Category.food,
        datetime: datetime);
  }

  group('Load', () {
    test('should initialize state', () async {
      final cost = Cost.of(
        id: 'id1',
        title: 'title',
        amount: 100,
        point: Point.one,
        category: Category.food,
      );
      when(costRepository.getAll())
          .thenAnswer((_) async => Costs(values: [cost]));

      await sut.load();

      verify(costRepository.getAll()).called(1);
      expect(sut.debugState.value!.costs, Costs(values: [cost]));
    });

    test('should sort cost by datetime in descending order', () async {
      final cost1 = costOf('cost-1', DateTime(2023, 1, 1));
      final cost2 = costOf('cost-2', DateTime(2023, 1, 3));
      final cost3 = costOf('cost-3', DateTime(2023, 1, 2));

      when(costRepository.getAll())
          .thenAnswer((_) async => Costs(values: [cost1, cost2, cost3]));

      await sut.load();

      var actualCosts = sut.debugState.value!.costs.values;
      expect(actualCosts, [cost2, cost3, cost1]);
    });
  });

  group('Remove', () {
    test('cost', () async {
      const costId = 'id1';
      when(costRepository.getAll())
          .thenAnswer((_) async => const Costs(values: []));

      await sut.remove(costId);

      verify(costRepository.remove(costId)).called(1);
      verify(costRepository.getAll()).called(1);
    });
  });
}
